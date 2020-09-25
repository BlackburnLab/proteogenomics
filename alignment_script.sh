#!/bin/sh
#SBATCH --account=cbio
#SBATCH --partition=ada
#SBATCH --nodes=1 --ntasks=30
#SBATCH --time=40:00:00
#SBATCH --job-name="alignment" 
#SBATCH --mail-user=oknjav001@myuct.ac.za
#SBATCH --mail-type=END,FAIL

#reads=/scratch/oknjav001/trial_rna_seq_data/trimmed_reads/T004-B2PPDBAL-PB-miRNA_S10_R1_001.merged_trimmed.fq.gz
star_index=/scratch/oknjav001/transcriptomics/proteogenomics/splicify/data/genome/star_index
STAR=/scratch/oknjav001/transcriptomics/proteogenomics/splicify/SPLICIFY/src/STAR
# Run STAR (~10min)
#Run LTB
cd /scratch/oknjav001/transcriptomics/complete_batch/complete_challenge_Group_RNAseq/bal_first_batch/LTB/trimmedData

gunzip *.gz

for infile in *.fq

do

${STAR} --genomeDir ${star_index} --readFilesIn ${infile}  --runThreadN 16 --outSAMtype BAM SortedByCoordinate --quantMode GeneCounts

done


#====================================PTB
cd /scratch/oknjav001/transcriptomics/complete_batch/complete_challenge_Group_RNAseq/bal_first_batch/PTB/trimmedPTB

gunzip *.gz

for infile in *.fq

do

${STAR} --genomeDir ${star_index} --readFilesIn ${infile}  --runThreadN 16 --outSAMtype BAM SortedByCoordinate --quantMode GeneCounts

done

# RTB
cd /scratch/oknjav001/transcriptomics/complete_batch/complete_challenge_Group_RNAseq/bal_first_batch/RTB/trimmedRtB

gunzip *.gz

for infile in *.fq

do

${STAR} --genomeDir ${star_index} --readFilesIn ${infile}  --runThreadN 16 --outSAMtype BAM SortedByCoordinate --quantMode GeneCounts

done

#==========SIM
cd /scratch/oknjav001/transcriptomics/complete_batch/complete_challenge_Group_RNAseq/bal_first_batch/SIM/trimmedSIM

gunzip *.gz

for infile in *.fq

do

${STAR} --genomeDir ${star_index} --readFilesIn ${infile}  --runThreadN 16 --outSAMtype BAM SortedByCoordinate --quantMode GeneCounts

done




