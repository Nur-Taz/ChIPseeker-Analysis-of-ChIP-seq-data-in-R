### Install necessary packages/dependencies

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install(version = "3.10")

BiocManager::install("TxDb.Hsapiens.UCSC.hg19.knownGene")

BiocManager::install("clusterProfiler")

BiocManager::install("org.Hs.eg.db")

BiocManager::install("ggupset")

BiocManager::install("ggimage")

BiocManager::install("ReactomePA")

### Load the installed packages

library(BiocManager)

library(ChIPseeker)

library(TxDb.Hsapiens.UCSC.hg19.knownGene)

library(clusterProfiler)

library(org.Hs.eg.db)

library(ggupset)

library(ggplot2)

library(ggimage)

library(ReactomePA)


### Set working directory

setwd ("/Users/nr267/Desktop/All Work/Classes/Spring 2020/ChIPseeker_2020/peak_files_bed/")


### Load and rename package for transcript-related features

txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

### Loading the files as a list

all_files <- list(NY8_1 = "../ChIPseeker_2020/peak_files_bed/GSM2891281_NY8_HNF1A_ChIP_1_peaks.bed", NY8_2 = "../ChIPseeker_2020/peak_files_bed/GSM2891283_NY8_HNF1A_ChIP_2_peaks.bed", NY15_1 = "../ChIPseeker_2020/peak_files_bed/GSM2891285_NY15_HNF1A_ChIP_1_peaks.bed", NY15_2 = "../ChIPseeker_2020/peak_files_bed/GSM2891287_NY15_HNF1A_ChIP_2_peaks.bed")

all_files

### Loading one file at a time

NY8_2_single <- readPeakFile("../ChIPseeker_2020/peak_files_bed/GSM2891283_NY8_HNF1A_ChIP_2_peaks.bed")

NY8_2_single

### Profiling the peaks from a single file

covplot (NY8_2_single, weightCol = "V5", title = "Peak Coverage Plot", xlab = "Chr size (bp)", ylab = "Peak Coverage")

covplot (NY8_2_single, weightCol = "V5", title = "Peak Coverage Plot", xlab = "Chr size (bp)", ylab = "Peak Coverage", chrs = c("chr2", "chr20", "chrX"), xlim = c(2e7, 4e7))

peakHeatmap(NY8_2_single, TxDb = txdb, upstream = 7000, downstream = 7000, color = "springgreen4")

plotAvgProf2(NY8_2_single, TxDb = txdb, upstream = 7000, downstream = 7000, xlab = "Genomic Region", ylab = "Read Count Freq", conf = 0.95, resample = 1000)

# BREAK 

## Annotation & visualization of peaks

Anno_NY8_2 <- annotatePeak(NY8_2_single, tssRegion = c (-7000, 7000), TxDb = txdb, annoDb = "org.Hs.eg.db")

plotAnnoPie(Anno_NY8_2, title = "Distribution of ChIP peaks")

plotAnnoBar(Anno_NY8_2, title = "Distribution of ChIP peaks")

vennpie(Anno_NY8_2)

upsetplot(Anno_NY8_2)

upsetplot(Anno_NY8_2, vennpie = TRUE)

plotDistToTSS(Anno_NY8_2, title = "Distribution of TF-binding peaks relative to TSS")

# BREAK

### Functional Enrichment Analysis

pathway_NY8_2 <- enrichPathway(as.data.frame(Anno_NY8_2)$geneId)
head(pathway_NY8_2, 5)

gene_NY8_2 <- seq2gene(NY8_2_single, tssRegion = c(-2000, 2000), flankDistance = 5000, TxDb = txdb)
pathway_NY8_2_gene <- enrichPathway(gene_NY8_2)
head(pathway_NY8_2_gene, 5)

dotplot (pathway_NY8_2_gene)

# BREAK

### Analyzing multiple files

peakHeatmap(all_files, TxDb = txdb, upstream = 7000, downstream = 7000, color = c("springgreen4", "blue", "maroon", "yellow"))

plotAvgProf2(all_files, TxDb = txdb, upstream = 7000, downstream = 7000, xlab = "Genomic Region", ylab = "Read Count Freq", conf = 0.95, resample = 1000)

Annotation_all <- lapply (all_files, annotatePeak, TxDb = txdb, tssRegion = c(-2000, 2000), verbose = FALSE)

plotAnnoBar (Annotation_all, title = "Distribution of ChIP peaks")

plotDistToTSS(Annotation_all, title = "Distribution of TF-binding peaks relative to TSS")

all_genes <- lapply (Annotation_all, function(i) as.data.frame(i)$geneId)
names(all_genes) = sub("_", "\n", names(all_genes))
compareKEGG <- compareCluster(geneClusters = all_genes, fun = "enrichKEGG", pvalueCutoff = 0.05, pAdjustMethod = "BH")

dotplot(compareKEGG, showCategory = 15, title = "Comparison of KEGG Pathway Enrichment Analysis")

# THE END










