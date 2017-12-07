#!/usr/bin/env Rscript

library("clusterProfiler")

# PARAMETERS

UpRegulatedGenes = "UP_KEGG.txt"
DownRegulatedGenes = "DOWN_KEGG.txt"

UpRegulatedPlot = "UP_enrichKEGG.pdf"
DownRegulatedPlot = "DOWN_enrichKEGG.pdf"

Species = "pvu"
Pvalue = 0.05

# IMPORT FILES

UP <- as.character(read.csv(UpRegulatedGenes, header=F)$V1)
DOWN <- as.character(read.csv(DownRegulatedGenes, header=F)$V1)

# KEGG enrichment analysis

enriched_UP <- enrichKEGG(gene = UP,
                          organism = Species,
                          pvalueCutoff = Pvalue,
                          keyType = 'kegg')

enriched_DOWN <- enrichKEGG(gene = DOWN,
                          organism = Species,
                          pvalueCutoff = Pvalue,
                          keyType = 'kegg')

# PLOTTING

pdf(UpRegulatedPlot)
dotplot(enriched_UP)
dev.off()

pdf(DownRegulatedPlot)
dotplot(enriched_DOWN)
dev.off()
