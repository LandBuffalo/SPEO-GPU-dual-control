#include "migrate.h"

Migrate::Migrate(NodeInfo node_info)
{
    node_info_ = node_info;
}

Migrate::~Migrate()
{

}

int Migrate::Initilize(IslandInfo island_info, ProblemInfo problem_info)
{
    island_info_ = island_info;
    problem_info_ = problem_info;
    int message_length = island_info_.migration_size * (problem_info_.dim + 1);
    send_msg_to_other_EA_ = new real[message_length];
    for(int i = 0; i < island_info_.island_size; i++)
        regroup_permutated_index_.push_back(i);
    success_sent_flag_ = 1;
    return 0;
}
int Migrate::Unitilize()
{
    delete []send_msg_to_other_EA_;
    regroup_permutated_index_.clear();

    return 0;
}

//send immigrations to its communication control unit
int Migrate::MigrateOut(EA_CUDA *EA_CUDA, Population &population)
{
    MPI_Status mpi_status;

    //check previous messages send successfully to its communication control unit
    if(success_sent_flag_ == 0)
    {
        MPI_Test(&mpi_request_, &success_sent_flag_, &mpi_status);
    }
    if (success_sent_flag_ == 1)
    {
        Population emigration_export;
        //load population from GPU global memory to CPU RAM
        EA_CUDA->TransferDataToCPU(population);
        //randomly select several individuals to send to communication control unit
        vector<int> tmp_ID = random_.Permutate(population.size(), island_info_.migration_size);
        for(int i = 0; i < island_info_.migration_size; i++)
            emigration_export.push_back(population[tmp_ID[i]]);

        int message_length = island_info_.migration_size * (problem_info_.dim + 1);
        int destination = node_info_.node_ID - 1;
        int tag = problem_info_.function_ID * 1000 +  10 * problem_info_.run_ID + EMIGRATIONS_EA;

        //serial the individuals to message style
        SerialIndividualToMsg(send_msg_to_other_EA_, emigration_export);
        //send message to its communication control unit
#ifdef GPU_DOUBLE_PRECISION
        MPI_Isend(send_msg_to_other_EA_, message_length, MPI_DOUBLE, destination, tag, MPI_COMM_WORLD, &mpi_request_);
#endif
#ifdef GPU_SINGLE_PRECISION
        MPI_Isend(send_msg_to_other_EA_, message_length, MPI_FLOAT, destination, tag, MPI_COMM_WORLD, &mpi_request_);
#endif
        success_sent_flag_ = 0;
    }
    RegroupIslands(EA_CUDA, population);

    return 0;
}
int Migrate::RegroupIslands(EA_CUDA *EA_CUDA, Population &population)
{   
    //dynamic and random ordered regrouping strategy
    if(island_info_.regroup_option == "dynamic_and_random")
    {
        int max_index = 0, pop_size = population.size() / MIN_SUBISLAND_SIZE;
        while (pop_size > 1)
        {
            pop_size = pop_size / 2;
            max_index++;
        }
        int subisland_size = MIN_SUBISLAND_SIZE;
        subisland_size = subisland_size << random_.RandIntUnif(0, max_index);
        island_info_.subisland_num = population.size() / subisland_size;
        regroup_permutated_index_.clear();
        regroup_permutated_index_ = random_.Permutate(population.size(), population.size());
        EA_CUDA->RegroupIslands(regroup_permutated_index_, island_info_);
        EA_CUDA->ConfigureEA();
    }
    //dynamic and fixed ordered regrouping strategy

   if(island_info_.regroup_option == "dynamic_and_ordered")
    {
        int max_index = 0, pop_size = population.size() / MIN_SUBISLAND_SIZE;
        while (pop_size > 1)
        {
            pop_size = pop_size / 2;
            max_index++;
        }
        int subisland_size = MIN_SUBISLAND_SIZE;
        subisland_size = subisland_size << random_.RandIntUnif(0, max_index);
        island_info_.subisland_num = population.size() / subisland_size;
        EA_CUDA->RegroupIslands(regroup_permutated_index_, island_info_);
        EA_CUDA->ConfigureEA();
    }
    //static and random ordered regrouping strategy
    if(island_info_.regroup_option == "static_and_random")
    {
        regroup_permutated_index_.clear();
        regroup_permutated_index_ = random_.Permutate(population.size(), population.size());
        EA_CUDA->RegroupIslands(regroup_permutated_index_, island_info_);
    }
    return 0;
}

//find the best individuals in entire island at GPU global memory
vector<int> Migrate::FindBestIndividualInIsland(Population &population)
{
    int subisland_size = island_info_.island_size / island_info_.subisland_num;
    vector<int> best_individual_index;
    for(int i = 0; i < island_info_.subisland_num; i++)
    {
        int tmp_best_individual_index = regroup_permutated_index_[i * subisland_size];
        real best_fitness_value = population[tmp_best_individual_index].fitness_value;
        for (int j = 1; j < subisland_size; j++)
        {
            int individual_index = regroup_permutated_index_[i * subisland_size + j];
            if(best_fitness_value > population[individual_index].fitness_value)
            {
                tmp_best_individual_index = individual_index;
                best_fitness_value = population[individual_index].fitness_value;
            }
        }
        best_individual_index.push_back(tmp_best_individual_index);
    }
    return best_individual_index;
}

//load immigrations from buffer and merge with current population at global memory
int Migrate::MigrateIn(EA_CUDA *EA_CUDA, Population &population)
{
    MPI_Status mpi_status;
    int flag = 0;
    int tag = problem_info_.function_ID * 1000 +  10 * problem_info_.run_ID + EMIGRATIONS_EA;
    //check wheher there is messages coming
    MPI_Iprobe(node_info_.node_ID - 1, tag, MPI_COMM_WORLD, &flag, &mpi_status);
    if(flag == 1)
    {
        int message_length = 0;
        //get the length of incoming message
#ifdef GPU_DOUBLE_PRECISION
        MPI_Get_count(&mpi_status, MPI_DOUBLE, &message_length);
#endif
#ifdef GPU_SINGLE_PRECISION
        MPI_Get_count(&mpi_status, MPI_FLOAT, &message_length);
#endif
        real * msg_recv = new real[message_length];

        //receive the incoming messages from communication control unit
#ifdef GPU_DOUBLE_PRECISION
        MPI_Recv(msg_recv, message_length, MPI_DOUBLE, mpi_status.MPI_SOURCE, mpi_status.MPI_TAG, MPI_COMM_WORLD, &mpi_status);
#endif
#ifdef GPU_SINGLE_PRECISION
        MPI_Recv(msg_recv, message_length, MPI_FLOAT, mpi_status.MPI_SOURCE, mpi_status.MPI_TAG, MPI_COMM_WORLD, &mpi_status);
#endif
        Population emigration_import;
        DeserialMsgToIndividual(emigration_import, msg_recv, message_length / (problem_info_.dim + 1));
        delete [] msg_recv;

        //write the current population in CPU RAM to GPU global memory
        EA_CUDA->TransferDataToCPU(population);
        vector<int> permutate_index = random_.Permutate(population.size(), emigration_import.size());
        for(int i = 0; i < permutate_index.size(); i++)
        {
            int selected_individual_index = permutate_index[i];
            population[selected_individual_index] = emigration_import[i];
        }
        EA_CUDA->TransferDataFromCPU(population);
    }

    return 0;
}


int Migrate::DeserialMsgToIndividual(vector<Individual> &individual, real *msg, int length)
{
    int count = 0;

    for (int i = 0; i < length; i++)
    {
        Individual local_individual;
        for(int j = 0; j < problem_info_.dim; j++)
        {
            local_individual.elements.push_back(msg[count]);
            count++;
        }
        local_individual.fitness_value = msg[count];
        count++;
        individual.push_back(local_individual);
    }
    return 0;
}


int Migrate::SerialIndividualToMsg(real *msg, vector<Individual> &individual)
{
    int count = 0;
    for (int i = 0; i < individual.size(); i++)
    {
        for (int j = 0; j < problem_info_.dim; j++)
        {
            msg[count] = individual[i].elements[j];
            count++;
        }
        msg[count] = individual[i].fitness_value;
        count++;
    }
    return 0;
}
