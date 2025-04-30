#!/bin/bash
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=48
#SBATCH --mem 700GB
#SBATCH --time=168:00:00
#SBATCH --job-name=Trinity_HUMID_ALL_X
#SBATCH --account=
#SBATCH --mail-type=ALL


module load python/3.7-2019.10
module load trinityrnaseq/2.12.0

cd $SLURM_SUBMIT_DIR

cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag1_50-Sample1_019_174_S12_L004_R1_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag1_50-Sample2_007_186_S13_L004_R1_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag1_50-Sample3_090_103_S14_L004_R1_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag1_85-Sample1_078_115_S15_L004_R1_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag1_85-Sample3_054_139_S17_L004_R1_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag1_100-Sample1_042_151_S18_L004_R1_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag1_100-Sample2_030_163_S19_L004_R1_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag1_100-Sample3_018_175_S20_L004_R1_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag2_50-Sample3_006_187_S21_L004_R1_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag2_85-Sample1_089_104_S22_L004_R1_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag2_100-Sample1_077_116_S23_L004_R1_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag3_50-Sample3_065_128_S24_L004_R1_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag3_85-Sample1_053_140_S25_L004_R1_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag3_100-Sample1_041_152_S26_L004_R1_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag4_50-Sample1_029_164_S27_L004_R1_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag4_85-Sample1_017_176_S28_L004_R1_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag4_100-Sample1_005_188_S29_L004_R1_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag4_100-Sample2_088_105_S30_L004_R1_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag4_100-Sample3_076_117_S31_L004_R1_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag1_50-Sample1_019_174_S12_L004_R2_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag1_50-Sample2_007_186_S13_L004_R2_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag1_50-Sample3_090_103_S14_L004_R2_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag1_85-Sample1_078_115_S15_L004_R2_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag1_85-Sample2_066_127_S16_L004_R2_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag1_85-Sample3_054_139_S17_L004_R2_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag1_100-Sample1_042_151_S18_L004_R2_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag1_100-Sample2_030_163_S19_L004_R2_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag1_100-Sample3_018_175_S20_L004_R2_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag2_50-Sample3_006_187_S21_L004_R2_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag2_85-Sample1_089_104_S22_L004_R2_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag2_100-Sample1_077_116_S23_L004_R2_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag3_50-Sample3_065_128_S24_L004_R2_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag3_85-Sample1_053_140_S25_L004_R2_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag3_100-Sample1_041_152_S26_L004_R2_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag4_50-Sample1_029_164_S27_L004_R2_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag4_85-Sample1_017_176_S28_L004_R2_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag4_100-Sample1_005_188_S29_L004_R2_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag4_100-Sample2_088_105_S30_L004_R2_001.cor.fq $TMPDIR
cp /HUMID_Samples/PreProcessing/Filter_Uncorrectable_Kmers/unfixrm_Bag4_100-Sample3_076_117_S31_L004_R2_001.cor.fq $TMPDIR




cd $TMPDIR

Trinity --seqType fq \
--samples_file /HUMID_Samples/HUMID_COMBINED/Excluded_Samples/sample_text_file_Trinity_HUMID_ALL_X.txt \
--SS_lib_type RF \
--trimmomatic \
--max_memory 690G \
--CPU 47 \
--min_contig_length 300 \
--output /HUMID_Samples/HUMID_COMBINED/Excluded_Samples/trinity_output_files_HUMID_ALL_X