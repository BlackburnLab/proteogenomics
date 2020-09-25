#!/bin/bash
#SBATCH --account=cbio
#SBATCH --partition=ada
#SBATCH --nodes=1 --ntasks=40
#SBATCH --time=170:00:00
#SBATCH --job-name="markduplicates"
#SBATCH --mail-user=javanokendo@gmail.com
#SBATCH --mail-type=END,FAIL

module load python/anaconda-python-2.7
module load software/bedtools-2.29
module load software/R-3.6.0
module load software/samtools-1.9

picard=/scratch/oknjav001/transcriptomics/proteogenomics/splicify/SPLICIFY/scripts/picard.jar

cd /scratch/oknjav001/transcriptomics/complete_batch/complete_challenge_Group_RNAseq/bal_first_batch/LTB/trimmedData

for bam in *.bam 

do
java -jar $picard MarkDuplicates INPUT=$bam OUTPUT=$bam_dedupe.bam METRICS_FILE=$bam_marked_dup_metrics.txt REMOVE_DUPLICATES=true 

done

## PTB 
cd /scratch/oknjav001/transcriptomics/complete_batch/complete_challenge_Group_RNAseq/bal_first_batch/PTB/trimmedPTB

for bam in *.bam

do
java -jar $picard MarkDuplicates INPUT=$bam OUTPUT=$bam_dedupe.bam METRICS_FILE=$bam_marked_dup_metrics.txt REMOVE_DUPLICATES=true

done

#RTB
cd /scratch/oknjav001/transcriptomics/complete_batch/complete_challenge_Group_RNAseq/bal_first_batch/RTB/trimmedRtB

for bam in *.bam

do
java -jar $picard MarkDuplicates INPUT=$bam OUTPUT=$bam_dedupe.bam METRICS_FILE=$bam_marked_dup_metrics.txt REMOVE_DUPLICATES=true

#done

## SIM
cd /scratch/oknjav001/transcriptomics/complete_batch/complete_challenge_Group_RNAseq/bal_first_batch/SIM/trimmedSIM

for bam in *.bam

do
java -jar $picard MarkDuplicates INPUT=$bam OUTPUT=$bam_dedupe.bam METRICS_FILE=$bam_marked_dup_metrics.txt REMOVE_DUPLICATES=true

done


















