#!/bin/bash
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=40
#SBATCH --time=4:00:00
#SBATCH --job-name=Extract_Cluster_DE_Transcripts_GOEnrichment_HUMID_ALL_X_3
#SBATCH --account=
#SBATCH --mail-type=ALL
 

module load python/3.7-2019.10 
module load trinityrnaseq/2.12.0 
module use ~/local/share/lmodfiles 
module load rsem 
module load R/4.1.0-gnu9.1
module use ~/R/x86_64-pc-linux-gnu-library/4.1 

cd $SLURM_SUBMIT_DIR

$TRINITY_HOME/Analysis/DifferentialExpression/analyze_diff_expr.pl \
--matrix RSEM.gene.TMM.EXPR.matrix \
-P 1e-2 -C 2 \
--examine_GO_enrichment \
--GO_annots  go_annotations_HUMID_ALL_X.txt \
--gene_lengths HUMID_ALL_X_Trinity.gene_lengths.txt \
--max_genes_clust 40000