#!/bin/bash
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=48
#SBATCH --time=100:00:00
#SBATCH --job-name=Align_Estimate_Abundance_HUMID_ALL_X
#SBATCH --account=
#SBATCH --mail-type=ALL


module load python/3.7-2019.10
module load trinityrnaseq/2.12.0
module use ~/local/share/lmodfiles
module load rsem


mkdir $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID

cd /HUMID_Samples/HUMID_COMBINED/Excluded_Samples

cp sample_text_file_HUMID_ALL_X.txt $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp CD-HIT-EST_HUMID_ALL_X.fasta $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID

cd /HUMID_Samples/HUMID_COMBINED/Excluded_Samples/trinity_output_files_HUMID_ALL_X

cp unfixrm_Bag1_50-Sample1_019_174_S12_L004_R1_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag1_50-Sample2_007_186_S13_L004_R1_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag1_50-Sample3_090_103_S14_L004_R1_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag1_85-Sample1_078_115_S15_L004_R1_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag1_85-Sample3_054_139_S17_L004_R1_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag1_100-Sample1_042_151_S18_L004_R1_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag1_100-Sample2_030_163_S19_L004_R1_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag1_100-Sample3_018_175_S20_L004_R1_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag2_50-Sample3_006_187_S21_L004_R1_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag2_85-Sample1_089_104_S22_L004_R1_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag2_100-Sample1_077_116_S23_L004_R1_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag3_50-Sample3_065_128_S24_L004_R1_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag3_85-Sample1_053_140_S25_L004_R1_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag3_100-Sample1_041_152_S26_L004_R1_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag4_50-Sample1_029_164_S27_L004_R1_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag4_85-Sample1_017_176_S28_L004_R1_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag4_100-Sample1_005_188_S29_L004_R1_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag4_100-Sample2_088_105_S30_L004_R1_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag4_100-Sample3_076_117_S31_L004_R1_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag1_50-Sample1_019_174_S12_L004_R2_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag1_50-Sample2_007_186_S13_L004_R2_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag1_50-Sample3_090_103_S14_L004_R2_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag1_85-Sample1_078_115_S15_L004_R2_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag1_85-Sample3_054_139_S17_L004_R2_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag1_100-Sample1_042_151_S18_L004_R2_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag1_100-Sample2_030_163_S19_L004_R2_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag1_100-Sample3_018_175_S20_L004_R2_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag2_50-Sample3_006_187_S21_L004_R2_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag2_85-Sample1_089_104_S22_L004_R2_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag2_100-Sample1_077_116_S23_L004_R2_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag3_50-Sample3_065_128_S24_L004_R2_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag3_85-Sample1_053_140_S25_L004_R2_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag3_100-Sample1_041_152_S26_L004_R2_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag4_50-Sample1_029_164_S27_L004_R2_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag4_85-Sample1_017_176_S28_L004_R2_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag4_100-Sample1_005_188_S29_L004_R2_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag4_100-Sample2_088_105_S30_L004_R2_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID
cp unfixrm_Bag4_100-Sample3_076_117_S31_L004_R2_001.cor.fq.P.qtrim.gz $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID


cd $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID

$TRINITY_HOME/util/align_and_estimate_abundance.pl --transcripts CD-HIT-EST_HUMID_ALL_X.fasta --seqType fq --samples_file sample_text_file_HUMID_ALL_X.txt --est_method RSEM --aln_method bowtie2 --thread_count 48 --debug --trinity_mode --prep_reference --include_rsem_bam --output_dir $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID

cp -R $TMPDIR/trinityalignment_output_files_$SLURM_JOB_ID $SLURM_SUBMIT_DIR
