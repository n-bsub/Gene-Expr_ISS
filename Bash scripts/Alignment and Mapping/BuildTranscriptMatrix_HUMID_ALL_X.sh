#!/bin/bash
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=48
#SBATCH --time=10:00:00
#SBATCH --job-name=BuildTranscriptMatrix_HUMID_ALL_X
#SBATCH --account=
#SBATCH --mail-type=ALL

module load python/3.7-2019.10
module load trinityrnaseq/2.12.0
module use ~/local/share/lmodfiles
module load rsem
module load R/3.6.3-gnu9.1
module use ~/users/PAS1182/osu8948/R/x86_64-pc-linux-gnu-library/3.6


cd $SLURM_SUBMIT_DIR


$TRINITY_HOME/util/abundance_estimates_to_matrix.pl --est_method RSEM \
--gene_trans_map CD-HIT-EST_HUMID_ALL_X.fasta.gene_trans_map \
--name_sample_by_basedir \
50RH_Bag1_1/RSEM.isoforms.results \
50RH_Bag1_2/RSEM.isoforms.results \
50RH_Bag1_3/RSEM.isoforms.results \
85RH_Bag1_1/RSEM.isoforms.results \
85RH_Bag1_2/RSEM.isoforms.results \
100RH_Bag1_1/RSEM.isoforms.results \
100RH_Bag1_2/RSEM.isoforms.results \
100RH_Bag1_3/RSEM.isoforms.results \
50RH_Bag2_1/RSEM.isoforms.results \
85RH_Bag2_1/RSEM.isoforms.results \
100RH_Bag2_1/RSEM.isoforms.results \
50RH_Bag3_1/RSEM.isoforms.results \
85RH_Bag3_1/RSEM.isoforms.results \
100RH_Bag3_1/RSEM.isoforms.results \
50RH_Bag4_1/RSEM.isoforms.results \
85RH_Bag4_1/RSEM.isoforms.results \
100RH_Bag4_1/RSEM.isoforms.results \
100RH_Bag4_2/RSEM.isoforms.results \
100RH_Bag4_3/RSEM.isoforms.results \