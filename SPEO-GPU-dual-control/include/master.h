#ifndef __MASTER_HH__
#define __MASTER_HH__
#include <mpi.h>
#include "buffer_manage.h"
#include "random.h"
#include "config.h"

class Master
{
private:
    //BufferManage        *   send_buffer_manage_;
    BufferManage        *   recv_buffer_manage_;    
    Population              send_buffer_Population_;
    Random					random_;
    IslandInfo              island_info_;
    ProblemInfo             problem_info_;
    NodeInfo				node_info_;
    vector<int>             destinations_;      //destination pool for selected island IDs

    MPI_Request             mpi_request_to_EA_;
    MPI_Request             mpi_request_to_island_;
    int                     flag_wait_new_send_to_EA_;
    int                     flag_wait_new_send_to_island_;
    real  *               msg_to_EA_;
    real  *               msg_to_island_;

    int                     flag_finish_;
    int                     RecvAndSendEmigrationToEA(MPI_Status *mpi_status);      //receive and send emigrations to its GPU control Unit
    int                     RecvEmigrationFromOtherMaster(MPI_Status *mpi_status);  //receive emigrations from other communication control Unit
    int                     SendEmigrationToOtherMaster();                          //send emigrations to other communication control Unit

    int					    RcvMessage();
    int                     DeserialMsgToIndividual(vector<Individual> &individual, real *msg_of_node_EA, int length); 
    int						SerialIndividualToMsg(real *msg_of_node_EA, vector<Individual> &individual);
    int                     GenerateDestinations();

public:
    Master(NodeInfo node_info);
    ~Master();
    int                     Execute();
    int 					Initilize(IslandInfo island_info, ProblemInfo problem_info);
    int 					Unitilize();

};
#endif
