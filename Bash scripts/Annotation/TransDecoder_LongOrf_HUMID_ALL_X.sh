#!/bin/bash
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=12
#SBATCH --time=1:00:00
#SBATCH --job-name=TransDecoder_LongOrf_HUMID_ALL_X
#SBATCH --account=
#SBATCH --mail-type=ALL


cd $SLURM_SUBMIT_DIR

export TransDecoder_HOME=$HOME/local/src/TransDecoder-TransDecoder-v5.5.0

$TransDecoder_HOME/TransDecoder.LongOrfs -t HUMID_Samples/HUMID_COMBINED/Excluded_Samples/CD-HIT-EST_HUMID_ALL_X.fasta

