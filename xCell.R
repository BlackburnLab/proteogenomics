
setwd("C:\\Users\\Javan_Okendo\\Desktop\\proteogenomics\\rnacounts")

#devtools::install_github('dviraran/xCell')

library(xCell)
exprMatrix = read.table("metad.txt",header=TRUE,row.names=1, as.is=TRUE)

df = xCellAnalysis(exprMatrix)

View(df)

#write.csv(df,"immunecellEnrichment.csv")

df2 = read.csv("immunecellEnrichment.csv",header = T, sep = ',',row.names = 1)

# The mtcars dataset:
data <- as.matrix(df2)

# Default Heatmap
heatmap(data)

# Use 'scale' to normalize
heatmap(data, scale="column")

# 1: native palette from R
heatmap(data, scale="column", col = cm.colors(256))
heatmap(data, scale="column", col = terrain.colors(256))

# 2: Rcolorbrewer palette
library(RColorBrewer)
coul <- colorRampPalette(brewer.pal(8, "PiYG"))(25)
heatmap(data, scale="column", col = coul)
