#include "master.h"
Master::Master(NodeInfo node_info)
{
    node_info_ = node_info;
}

Master::~Master()
{

}


int Master::Initilize(IslandInfo island_info, ProblemInfo problem_info)
{
    island_info_ = island_info;
    problem_info_ = problem_info;

    recv_buffer_manage_ = new OnlineCluster(island_info_.buffer_capacity);
    //send_buffer_manage_ = new RandomSelect(island_info_.island_size);
    GenerateDestinations();
    flag_finish_ = 0;

    flag_wait_new_send_to_EA_ = 1;
    flag_wait_new_send_to_island_ = 1;

    msg_to_EA_ = new real[island_info_.buffer_capacity * (problem_info_.dim + 1)];
    msg_to_island_ = new real[island_info_.migration_size * (problem_info_.dim + 1)];

}
int Master::Unitilize()
{
    //delete send_buffer_manage_;
    send_buffer_Population_.clear();
    delete recv_buffer_manage_;
    delete []msg_to_EA_;
    delete []msg_to_island_;

    return 0;
}
int Master::GenerateDestinations()
{
	if(destinations_.size() == 0)
	{
		for (int i = 0; i < node_info_.GPU_num; i++)
		{
			if(random_.RandRealUnif(0,1) < island_info_.migration_rate && i != node_info_.GPU_ID)
				destinations_.push_back(node_info_.node_num / node_info_.GPU_num * i);
		}
	}
}

int Master::RecvAndSendEmigrationToEA(MPI_Status *mpi_status)
{
    int message_recv_length = 0;
#ifdef GPU_DOUBLE_PRECISION
    MPI_Get_count(mpi_status, MPI_DOUBLE, &message_recv_length);
#endif
#ifdef GPU_SINGLE_PRECISION
    MPI_Get_count(mpi_status, MPI_FLOAT, &message_recv_length);
#endif
    real * msg_recv = new real[message_recv_length];
#ifdef GPU_DOUBLE_PRECISION
    MPI_Recv(msg_recv, message_recv_length, MPI_DOUBLE, mpi_status->MPI_SOURCE, mpi_status->MPI_TAG, MPI_COMM_WORLD, mpi_status);
#endif
#ifdef GPU_SINGLE_PRECISION
    MPI_Recv(msg_recv, message_recv_length, MPI_FLOAT, mpi_status->MPI_SOURCE, mpi_status->MPI_TAG, MPI_COMM_WORLD, mpi_status);
#endif
    send_buffer_Population_.clear();
    DeserialMsgToIndividual(send_buffer_Population_, msg_recv, message_recv_length / (problem_info_.dim + 1));

    delete [] msg_recv;
    if(flag_wait_new_send_to_EA_ == 0)
    {
        MPI_Test(&mpi_request_to_EA_, &flag_wait_new_send_to_EA_, mpi_status);
    }
    if(flag_wait_new_send_to_EA_ == 1)
    {
	    Population emigration_in;
	    recv_buffer_manage_->SelectFromBuffer(emigration_in, island_info_.migration_size);
        if(emigration_in.size() > 0)
        {
            int message_send_length = emigration_in.size() * (problem_info_.dim + 1);
            SerialIndividualToMsg(msg_to_EA_, emigration_in);
            int tag = problem_info_.function_ID * 1000 +  10 * problem_info_.run_ID + EMIGRATIONS_EA;
#ifdef GPU_DOUBLE_PRECISION
            MPI_Isend(msg_to_EA_, message_send_length, MPI_DOUBLE, node_info_.node_ID + 1, tag, MPI_COMM_WORLD, &mpi_request_to_EA_);
#endif
#ifdef GPU_SINGLE_PRECISION
            MPI_Isend(msg_to_EA_, message_send_length, MPI_FLOAT, node_info_.node_ID + 1, tag, MPI_COMM_WORLD, &mpi_request_to_EA_);
#endif
            flag_wait_new_send_to_EA_ = 0;
        }
    }

    return 0;
}

int Master::SendEmigrationToOtherMaster()
{
    MPI_Status mpi_status;
    GenerateDestinations();
    if(flag_wait_new_send_to_island_ == 0)
    {
        MPI_Test(&mpi_request_to_island_, &flag_wait_new_send_to_island_, &mpi_status);
    }
    if (flag_wait_new_send_to_island_ == 1)
    {
    	Population emigration_export;
      //send_buffer_manage_->SelectFromBuffer(emigration_export, island_info_.migration_size);
    	vector<int> emigration_export_ID = random_.Permutate(send_buffer_Population_.size(), island_info_.migration_size);
    	for(int i = 0; i < emigration_export_ID.size(); i++)
			emigration_export.push_back(send_buffer_Population_[emigration_export_ID[i]]);
		int message_length = emigration_export.size() * (problem_info_.dim + 1);
        SerialIndividualToMsg(msg_to_island_, emigration_export);
        int tag = problem_info_.function_ID * 1000 +  10 * problem_info_.run_ID + EMIGRATIONS_ISLAND;
#ifdef GPU_DOUBLE_PRECISION
        MPI_Isend(msg_to_island_, message_length, MPI_DOUBLE, destinations_[0], tag, MPI_COMM_WORLD, &mpi_request_to_island_);
#endif
#ifdef GPU_SINGLE_PRECISION
        MPI_Isend(msg_to_island_, message_length, MPI_FLOAT, destinations_[0], tag, MPI_COMM_WORLD, &mpi_request_to_island_);
#endif
        destinations_.erase(destinations_.begin());
        flag_wait_new_send_to_island_ = 0;
    }

    return 0;
}

int Master::RecvEmigrationFromOtherMaster(MPI_Status *mpi_status)
{
    int message_recv_length = 0;
#ifdef GPU_DOUBLE_PRECISION
    MPI_Get_count(mpi_status, MPI_DOUBLE, &message_recv_length);
#endif
#ifdef GPU_SINGLE_PRECISION
    MPI_Get_count(mpi_status, MPI_FLOAT, &message_recv_length);
#endif
    real * msg_recv = new real[message_recv_length];
#ifdef GPU_DOUBLE_PRECISION
    MPI_Recv(msg_recv, message_recv_length, MPI_DOUBLE, mpi_status->MPI_SOURCE, mpi_status->MPI_TAG, MPI_COMM_WORLD, mpi_status);
#endif
#ifdef GPU_SINGLE_PRECISION
    MPI_Recv(msg_recv, message_recv_length, MPI_FLOAT, mpi_status->MPI_SOURCE, mpi_status->MPI_TAG, MPI_COMM_WORLD, mpi_status);
#endif
    Population tmp_buffer;
    DeserialMsgToIndividual(tmp_buffer, msg_recv, message_recv_length / (problem_info_.dim + 1));
    recv_buffer_manage_->UpdateBuffer(tmp_buffer);
    delete []msg_recv;
    return 0;
}


int Master::RcvMessage()
{
    MPI_Status mpi_status;
    int flag = 0;
    int tag = problem_info_.function_ID * 1000 +  10 * problem_info_.run_ID;
    MPI_Iprobe(MPI_ANY_SOURCE, MPI_ANY_TAG, MPI_COMM_WORLD, &flag, &mpi_status);

    if(flag == 1)
    {
	    if(mpi_status.MPI_TAG == (tag + EMIGRATIONS_EA))
	        RecvAndSendEmigrationToEA(&mpi_status);
	    else if(mpi_status.MPI_TAG == (tag + EMIGRATIONS_ISLAND))
	        RecvEmigrationFromOtherMaster(&mpi_status);
	    else if(mpi_status.MPI_TAG == (tag + FLAG_FINISH))
	    {
	       int tmp_finish_flag = 0;
	       MPI_Recv(&tmp_finish_flag, 1, MPI_INT, mpi_status.MPI_SOURCE, mpi_status.MPI_TAG, MPI_COMM_WORLD, &mpi_status);
	       if(tmp_finish_flag == 1)
	        flag_finish_++;
	    }
    }
    if(destinations_.size() > 0 && send_buffer_Population_.size() > 0)
		SendEmigrationToOtherMaster();

    return 0;
}

int Master::Execute()
{
    while(flag_finish_ != island_info_.island_num)
    {
        RcvMessage();
    }

    return 0;
}


int Master::DeserialMsgToIndividual(vector<Individual> &individual, real *msg, int length)
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

int Master::SerialIndividualToMsg(real *msg, vector<Individual> &individual)
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

