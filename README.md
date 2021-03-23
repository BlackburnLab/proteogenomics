## Proteogenomics analysis of Human bronchoalveolar lavage fluid
#### Genomics of the variants analysis was done using the [GATK pipeline](https://gatk.broadinstitute.org/hc/en-us/articles/360035531192?id=4067)
The general steps for me are:
- [x] trim reads; Quality control of the RNAseq data was done using FastQC and trime galore which used cutadapt as a wrapper was using it trimming of the adapter sequences.
- [x] STAR aligner was used to align the RNAseq raw files to the reference genome (hg19)
- [x] Mark duplicates and remove duplicates; picard software was used to mark duplicate reads and the marked duplicates were removed from the final bam files using picard tool
- [x] SplitNCigarReads; Because RNA aligners have different conventions than DNA aligners, we need to reformat some of the alignments that span introns for HaplotypeCaller. This step splits reads with N in the cigar into multiple supplementary alignments and hard clips mismatching overhangs.
- [x] Base Quality Recalibration; 
- [x] use HaplotypeCaller, within the GATK pipeline was used to generate vcf files. 
- [x] The Variant Effect Predictor was used to asses the effect of the variants that were identified from our data
- [x] The VCF files were then filtered and used in the construction of a variant protein sequence database.
--------------
- ![workflow image](https://user-images.githubusercontent.com/26459707/110240744-099aff80-7f56-11eb-950c-36cff925ffd6.png)

## Variant annotation
- [x] Variant annotation for the vcf file generated above was done using the [Variant Effect Predictor](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-016-0974-4)
- [x] Genome annotation was downloaded from:https://www.ensembl.org/info/data/ftp/index.html

### Variant protein database construction from the vcf files
- [x] Use [pgdb](https://github.com/nf-core/pgdb)
### Proteomics analysis
- MaxQuant analysis using the sample specific database
- pathway analysis
- Differential analysis
- Pathway analysis
## Results
- The total number of transcripts with variants was 27924 and the proteins with the variants was 52548.
## Papers to be read
- [Integrated Multi-Omic Analysis of Mycobacterium tuberculosis H37Ra Redefines Virulence Attributes](https://www.frontiersin.org/articles/10.3389/fmicb.2018.01314/full)
- [Proteome analysis of the Mycobacterium tuberculosis Beijing B0/W148 cluster ](https://www.nature.com/articles/srep28985)
