#!/bin/bash
sbatch --ntasks 128 SPEO_GPU.sh 4096 23 30 65
sbatch --ntasks 128 SPEO_GPU.sh 4096 23 30 650
sbatch --ntasks 128 SPEO_GPU.sh 4096 23 30 3250
sbatch --ntasks 128 SPEO_GPU.sh 4096 23 30 6500

sbatch --ntasks 32 SPEO_GPU.sh 4096 23 30 260
sbatch --ntasks 32 SPEO_GPU.sh 4096 23 30 2600
sbatch --ntasks 32 SPEO_GPU.sh 4096 23 30 13000

sbatch --ntasks 32 SPEO_GPU.sh 4096 23 26 26000
sbatch --ntasks 32 SPEO_GPU.sh 4096 27 30 26000

sbatch --ntasks 4 SPEO_GPU.sh 4096 23 30 2080
sbatch --ntasks 4 SPEO_GPU.sh 4096 23 26 20800
sbatch --ntasks 4 SPEO_GPU.sh 4096 27 30 20800

sbatch --ntasks 4 SPEO_GPU.sh 4096 23 23 104000
sbatch --ntasks 4 SPEO_GPU.sh 4096 24 24 104000
sbatch --ntasks 4 SPEO_GPU.sh 4096 25 25 104000
sbatch --ntasks 4 SPEO_GPU.sh 4096 26 26 104000
sbatch --ntasks 4 SPEO_GPU.sh 4096 27 27 104000
sbatch --ntasks 4 SPEO_GPU.sh 4096 28 28 104000
sbatch --ntasks 4 SPEO_GPU.sh 4096 29 29 104000
sbatch --ntasks 4 SPEO_GPU.sh 4096 30 30 104000

sbatch --ntasks 4 SPEO_GPU.sh 4096 23 23 208000
sbatch --ntasks 4 SPEO_GPU.sh 4096 24 24 208000
sbatch --ntasks 4 SPEO_GPU.sh 4096 25 25 208000
sbatch --ntasks 4 SPEO_GPU.sh 4096 26 26 208000
sbatch --ntasks 4 SPEO_GPU.sh 4096 27 27 208000
sbatch --ntasks 4 SPEO_GPU.sh 4096 28 28 208000
sbatch --ntasks 4 SPEO_GPU.sh 4096 29 29 208000
sbatch --ntasks 4 SPEO_GPU.sh 4096 30 30 208000
