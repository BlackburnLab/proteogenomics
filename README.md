# Proteogenomics analysis of Omics data

This repo will document the procedure used in the analysis of the proteomic and transcriptomic data
#### Steps
- Quality control of the RNAseq data; using FastQC and trime_galore for low quality read assessment and removal of the adapted sequences.
- Sequence alignment using STAR splice aware aligner to the hg19 reference genome
- Variant sequence extraction from the RNAseq data
- MaxQuant analysis using the sample specific database
- Differential analysis
