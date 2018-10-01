#ifndef __ISLANDEA_H__
#define __ISLANDEA_H__
#pragma once
#include "config.h"
#include "random.h"
#include "EA_CUDA.h"
#include "migrate.h"

class IslandEA
{
private:
	EA_CUDA	*				EA_CUDA_;				//CUDA-based EA
	Random                  random_;
	NodeInfo				node_info_;
	Migrate 				migrate_;

	ProblemInfo				problem_info_;
	IslandInfo				island_info_;

	Individual 				best_individuals_;		//best individuals in current population
    Population 				sub_population_;		//the sub-population processed by this GPU

	DisplayUnit				display_unit_;
	real 					start_time_;
    string 					file_name_;

	int						RunEA();
    int                     RecordDisplayUnit(real current_time, real communication_time);		
	int 					PrintResult();
	int 					SendFlagFinish();
	int 					RecvResultFromOtherIsland(vector<DisplayUnit> &total_display_unit);		//receive final results from other islands
	int 					MergeResults(vector<DisplayUnit> &total_display_unit);				//merge all results for final print
	int 					CheckAndCreatRecordFile();
	int 					SendResultToIsland0();
    int                    	Finish();
public:
							IslandEA(const NodeInfo node_info);
							~IslandEA();
	int 					Initilize(IslandInfo island_info, ProblemInfo problem_info);
	int 					Unitilize();
	int						Execute();
};

#endif
