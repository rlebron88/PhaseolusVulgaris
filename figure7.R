#!/usr/bin/env Rscript

library("clusterProfiler")
library("pathview")

# PARAMETERS

UpRegulatedGenes = "UP_KEGG.txt"
DownRegulatedGenes = "DOWN_KEGG.txt"

Species = "pvu"

# IMPORT FILES

UP <- as.character(read.csv(UpRegulatedGenes, header=F)$V1)
DOWN <- as.character(read.csv(DownRegulatedGenes, header=F)$V1)

# GET IDS

UP_genes <- bitr_kegg(UP, fromType = "kegg", toType = "ncbi-geneid", organism = Species)[[2]]
DOWN_genes <- bitr_kegg(DOWN, fromType = "kegg", toType = "ncbi-geneid", organism = Species)[[2]]

# PLOTTING

pathview(gene.data  = DOWN_genes,
                     ppvuway.id = "pvu03010",
                     species    = "pvu")

pathview(gene.data  = DOWN_genes,
                     ppvuway.id = "pvu00195",
                     species    = "pvu")

pathview(gene.data  = DOWN_genes,
                     ppvuway.id = "pvu00860",
                     species    = "pvu")
                     
pathview(gene.data  = DOWN_genes,
                     ppvuway.id = "pvu00061",
                     species    = "pvu")

pathview(gene.data  = UP_genes,
                     ppvuway.id = "pvu00592",
                     species    = "pvu")
