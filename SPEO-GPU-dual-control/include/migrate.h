#ifndef __MIGRATE_HH__
#define __MIGRATE_HH__
#include <mpi.h>
#include "random.h"
#include "config.h"
#include "buffer_manage.h"
#include "EA_CUDA.h"

class Migrate
{
private:
	Random					random_;
	IslandInfo              island_info_;
	ProblemInfo             problem_info_;
	NodeInfo				node_info_;
    MPI_Request             mpi_request_;
    int                     success_sent_flag_;
    real *				    send_msg_to_other_EA_;         //message style of population
    int     				flag_finish_;                  //flag for whether finish
    vector<int>             regroup_permutated_index_;      //rpermutated indexs for dynamic regrouping
    int  					RegroupIslands(EA_CUDA *EA_CUDA, Population &population); //perform dynamic regrouping scheme
    vector<int>             FindBestIndividualInIsland(Population &population);
	int						SerialIndividualToMsg(real *msg_of_node_EA, vector<Individual> &individual);
    int                     DeserialMsgToIndividual(vector<Individual> &individual, real *msg_of_node_EA, int length);
public:
							Migrate(const NodeInfo node_info);
							~Migrate();
	int 					Initilize(IslandInfo island_info, ProblemInfo problem_info);
	int 					Unitilize();
    int                     MigrateOut(EA_CUDA *EA_CUDA, Population &population);
    int                     MigrateIn(EA_CUDA *EA_CUDA, Population &population);
};
#endif
