# Proteogenomics analysis of Omics data
### Genomics analysis pipeline; [GATK pipeline](https://gatk.broadinstitute.org/hc/en-us/articles/360035531192?id=4067)
The general steps for me are:
- trim reads; Quality control of the RNAseq data was done using FastQC and trime galore which used cutadapt as a wrapper was using it trimming of the adapter sequences.
- STAR aligner was used to align the RNAseq raw files to the reference genome (hg19)
- mark duplicates; picard software was used to mark duplicate reads and the marked duplicates were removed from the final bam files using picard tool
- SplitNCigarReads; Because RNA aligners have different conventions than DNA aligners, we need to reformat some of the alignments that span introns for HaplotypeCaller. This step splits reads with N in the cigar into multiple supplementary alignments and hard clips mismatching overhangs.
- Base Quality Recalibration; 
- use HaplotypeCaller, within the GATK pipeline was used to generate vcf files. 
- The VCF files were then filtered and used in the construction of a variant protein sequence database.

### Variant protein database construction from the vcf files
- [x] use customprodbj
### Proteomics analysis
- MaxQuant analysis using the sample specific database
- Differential analysis
