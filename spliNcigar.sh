#!/bin/bash
#SBATCH --account=cbio
#SBATCH --partition=ada
#SBATCH --nodes=1 --ntasks=40
#SBATCH --time=170:00:00
#SBATCH --job-name="splitNcigar"
#SBATCH --mail-user=javanokendo@gmail.com
#SBATCH --mail-type=END,FAIL

module load python/anaconda-python-2.7
module load software/bedtools-2.29
module load software/R-3.6.0
module load software/samtools-1.9

gatk=/scratch/oknjav001/transcriptomics/proteogenomics/variabtcalling/gatk/gatk-4.1.7.0
fasta=/scratch/oknjav001/transcriptomics/proteogenomics/splicify/data/genome/hg19.fa


$gatk SplitNCigarReads \
      -R ${fasta} \
      -I input.bam \
      -O output.bam
