#!/bin/bash
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=60
#SBATCH --time=168:00:00
#SBATCH --mem 2250GB
#SBATCH --job-name=CD_HIT_EST_HUMID_ALL_X
#SBATCH --account=
#SBATCH --mail-type=ALL


module load python/2.7-conda5.2

cd_hit_est="/cd-hit-v4.8.1-2019-0228/cd-hit-est"

  # Run cd-hit-est
  "${cd_hit_est}" \
-i /HUMID_Samples/HUMID_COMBINED/Excluded_Samples/trinity_output_files_HUMID_ALL_X/Trinity.fasta \
-c 0.8 \
-n 4 \
-T 0 \
-M 0 \
-o /HUMID_Samples/HUMID_COMBINED/Excluded_Samples/CD-HIT-EST_HUMID_ALL_X.fasta \