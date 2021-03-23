
setwd("C:\\Users\\Javan_Okendo\\Desktop\\proteogenomics\\proteoDB\\differentialAnalysis")

ltbbcg <- read.csv("SIM_B1-SIM_PPD.txt",header = T, sep = ',')

# Tidy column names -------------------------------------------------------
ltbdf <- dplyr::rename_all(ltbbcg, tolower) # change the column names to lowercase
colnames(ltbdf)
counts = na.omit(ltbdf)

#===================================

#write.csv(counts,"SIM_PPD.csv")

df = read.csv("PTB_PPD.csv",header = T, sep = ',')
df

#========================================================================
# we want the log2 fold change 
original_gene_list <- df$effectsize

# name the vector
names(original_gene_list) <- df$genename

# omit any NA values 
gene_list<-na.omit(original_gene_list)

# sort the list in decreasing order (required for clusterProfiler)
gene_list = sort(gene_list, decreasing = TRUE)

#===================================================================
library(org.Hs.eg.db)
library(clusterProfiler)

gse <- gseGO(geneList=gene_list, 
             ont ="BP", 
             keyType = "ENSEMBLPROT", 
             nPerm = 10000, 
             minGSSize = 3, 
             maxGSSize = 800, 
             pvalueCutoff = 0.05, 
             verbose = TRUE, 
             OrgDb = org.Hs.eg.db, 
             pAdjustMethod = "none")

## remove redundent GO terms
gse <- simplify(gse)

#====================================================================
require(DOSE)
dotplot(gse,showCategory=20)

dotplot(gse, showCategory=15, split=".sign") + facet_grid(.~.sign)
dotplot(gse, split="ONTOLOGY") + facet_grid(ONTOLOGY~., scale="free")

ridgeplot(gse)

emapplot(gse,showCategory = 30)

goplot(gse, showCategory = 30)
cnetplot(gse, categorySize="pvalue", foldChange=gene_list)
cnetplot(gse, foldChange=gene_list, circular = TRUE, colorEdge = TRUE)

#===================================================================
library(enrichplot)
de <- names(gene_list)[abs(gene_list) > 2]

ego <- enrichGO(de, OrgDb = "org.Hs.eg.db", ont="BP", keyType = "ENSEMBLPROT",readable=TRUE)

## remove redundent GO terms
ego2 <- simplify(ego)
cnetplot(ego2, foldChange=gene_list,title = "GO Biological Pathways")
dotplot(ego, showCategory=30)

cnetplot(ego2, foldChange=gene_list, circular = TRUE, colorEdge = TRUE)
upsetplot(ego)

heatplot(ego2, foldChange=gene_list,showCategory=30)
emapplot(ego2)

#============================
barplot(ego2, 
        drop = TRUE, 
        showCategory = 10, 
        title = "GO Biological Pathways",
        font.size = 8)

dotplot(ego2)
goplot(ego2, showCategory = 10)











