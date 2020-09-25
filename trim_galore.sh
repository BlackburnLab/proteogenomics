#!/bin/bash
#SBATCH --account=cbio
#SBATCH --partition=ada
#SBATCH --nodes=1 --ntasks=40
#SBATCH --time=170:00:00
#SBATCH --job-name="trim_galore"
#SBATCH --mail-user=javanokendo@gmail.com
#SBATCH --mail-type=END,FAIL

module load python/anaconda-python-2.7
module load software/bedtools-2.29
module load software/R-3.6.0
module load software/samtools-1.9
module load python/miniconda3

# Latent TB
cd /scratch/oknjav001/transcriptomics/complete_batch/complete_challenge_Group_RNAseq/bal_first_batch/LTB

trim_galore \
--quality 20 \
--fastqc \
--length 25 \
--output_dir /scratch/oknjav001/transcriptomics/complete_batch/complete_challenge_Group_RNAseq/bal_first_batch/LTB/trimmedData *.fastq.gz

#Previous TB
cd /scratch/oknjav001/transcriptomics/complete_batch/complete_challenge_Group_RNAseq/bal_first_batch/PTB
trim_galore \
--quality 20 \
--fastqc \
--length 25 \
--output_dir /scratch/oknjav001/transcriptomics/complete_batch/complete_challenge_Group_RNAseq/bal_first_batch/PTB/trimmedPTB *.fastq.gz

#RTB
cd /scratch/oknjav001/transcriptomics/complete_batch/complete_challenge_Group_RNAseq/bal_first_batch/RTB
trim_galore \
--quality 20 \
--fastqc \
--length 25 \
--output_dir /scratch/oknjav001/transcriptomics/complete_batch/complete_challenge_Group_RNAseq/bal_first_batch/RTB/trimmedRtB  *.fastq.gz

#SIM
cd /scratch/oknjav001/transcriptomics/complete_batch/complete_challenge_Group_RNAseq/bal_first_batch/SIM
trim_galore \
--quality 20 \
--fastqc \
--length 25 \
--output_dir /scratch/oknjav001/transcriptomics/complete_batch/complete_challenge_Group_RNAseq/bal_first_batch/SIM/trimmedSIM  *.fastq.gz

