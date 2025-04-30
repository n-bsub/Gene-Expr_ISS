 #!/bin/bash
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=12
#SBATCH --time=01:00:00
#SBATCH --job-name=Trinotate_sqlite_Gen_Annotation_Report_HUMID_ALL_X
#SBATCH --account=
#SBATCH --mail-type=ALL

cd $SLURM_SUBMIT_DIR

export TRINOTATE_HOME=$HOME/local/src/Trinotate-Trinotate-v3.2.2

$TRINOTATE_HOME/Trinotate Trinotate_HUMID_ALL_X.sqlite report > trinotate_annotation_report.HUMID_ALL_X.xls