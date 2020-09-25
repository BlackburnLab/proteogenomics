# Proteogenomics analysis of Omics data

This repo will document the procedure used in the analysis of the proteomic and transcriptomic data; The analysis pipeline; https://github.com/twbattaglia/RNAseq-workflow
- Sequence alignment using STAR splice aware aligner to the hg19 reference genome
- Variant sequence extraction from the RNAseq data
- MaxQuant analysis using the sample specific database
- Differential analysis

# Genomics analysis pipeline
The general steps for me are:
- trim reads; Quality control of the RNAseq data was done using FastQC and trime galore which used cutadapt as a wrapper was using it trimming of the adapter sequences.
- STAR aligner was used to align the RNAseq raw files to the reference genome (hg19)
- mark duplicates; picard software was used to mark duplicate reads and the marked duplicates were removed from the final bam files using picard tool
- use HaplotypeCaller, within the GATK pipeline was used to generate vcf files. 
- The VCF files were then filtered and used in the construction of a variant protein sequence database.

# Variant protein database construction from the vcf files
