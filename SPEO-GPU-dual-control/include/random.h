#ifndef __RANDOM_H__
#define __RANDOM_H__
#pragma once
#include "config.h"
class Random
{
public:
	Random();
	~Random();
	int			         Permutate(vector<int> & requested_island_ID, int arrary_length, int permutation_length); //permutate permutation_length int variable randomly from arrary_length
	vector<int>	           Permutate(int arrary_length, int permutation_length); //permutate permutation_length int variable randomly from arrary_length
	vector<int>	           Permutate(int arrary_length, int permutation_length, vector<int> &avoid_index); //permutate permutation_length int variable randomly from arrary_length


	int 			Permutate(int * permutate_index, int arrary_length, int permutation_length); //permutate permutation_length int variable randomly from arrary_length
	int			     RandIntUnif(int min_value, int max_value); //generate random int variables in [min_value, max_value] 
	real 			RandRealUnif(real min_value, real max_value); //generate random float variables in [min_value, max_value] 



};

#endif
