# ChIPseeker-Analysis-of-ChIP-seq-data-in-R

ChIPseeker is a very useful R package for carrying out detailed analyses on Chromatin Immunoprecipitation (ChIP)- sequencing data that lists the genomic intervals or "peaks" for a transcription factor binding to the genome. This hands-on session will have two parts:

### Class Orientation (10 mins)
* Link to presentation slides: https://github.com/Nur-Taz/ChIPseeker-Analysis-of-ChIP-seq-data-in-R/blob/master/ChIPseeker_Rpackage.pdf

### Foundations of R and BioConductor (30 mins)

Understand the context of Chipseeker by taking a brief look at BioConductor, identifying documentation sources, and covering foundational R concepts and syntax.<br/> 
* BioConductor: 
  * Bioconductor provides tools for the analysis and comprehension of high-throughput genomic data. 
  * Bioconductor uses the R statistical programming language, and is open source and open development. 
  * It has two releases each year, and an active user community.
  * All Bioconductor packages can be found here: https://bioconductor.org/packages/release/BiocViews.html#___Software
* ChIPseeker documentation:https://bioconductor.org/packages/release/bioc/manuals/ChIPseeker/man/ChIPseeker.pdf 
* Foundational R for Chipseeker: [click here to view the R markdown file](https://sauuyer.github.io/intro-to-r-for-seurat/r-intro-chipseeker.html) 


### Using ChIPseeker (2 hours)

Summarize & visualize important information about the peaks<br/> 
Annotate the peaks with gene ID as well as genomic location<br/>
Carry out functional enrichment analysis on the peaks<br/>

* [R script for analysis](https://github.com/Nur-Taz/ChIPseeker-Analysis-of-ChIP-seq-data-in-R/blob/master/Analysis_example_ChIPseeker.R)
* [PDF of analysis file with outputs](https://github.com/Nur-Taz/ChIPseeker-Analysis-of-ChIP-seq-data-in-R/blob/master/ChIPseeker_analysis_GSE108150.pdf)

### Important packages from Bioconductor

#### Genome wide annotation packages

[Human: org.Hs.eg.db](https://bioconductor.org/packages/3.10/data/annotation/html/org.Hs.eg.db.html)<br/>
[Mouse: org.Mm.eg.db](https://bioconductor.org/packages/3.10/data/annotation/html/org.Mm.eg.db.html)<br/>

#### Annotation package for TxDb object

[Human hg38 known genes](http://www.bioconductor.org/packages/release/data/annotation/html/TxDb.Hsapiens.UCSC.hg38.knownGene.html)
[Human hg19 known genes](http://bioconductor.org/packages/3.10/data/annotation/html/TxDb.Hsapiens.UCSC.hg19.knownGene.html)<br/>
[Human hg19 linc RNAs](http://bioconductor.org/packages/3.10/data/annotation/html/TxDb.Hsapiens.UCSC.hg19.lincRNAsTranscripts.html)<br/>
[Mouse mm10 Ensembl genes](http://bioconductor.org/packages/3.10/data/annotation/html/TxDb.Mmusculus.UCSC.mm10.ensGene.html)<br/>
[Mouse mm10 known genes](http://bioconductor.org/packages/3.10/data/annotation/html/TxDb.Mmusculus.UCSC.mm10.knownGene.html)<br/>

#### Functional enrichment analysis

[Disease Ontology](http://bioconductor.org/packages/DOSE)<br/>
[Reactome Pathway](http://bioconductor.org/packages/ReactomePA)<br/>
[clusterProfiler](http://bioconductor.org/packages/clusterProfiler)<br/>

For further information, please refer to:<br/>
G Yu, LG Wang, QY He. ChIPseeker: an R/Bioconductor package for ChIP peak annotation, comparison and visualization. Bioinformatics 2015, 31(14):2382-2383<br/>
[Link to paper](http://dx.doi.org/10.1093/bioinformatics/btv145)<br/>
[Link to vignette](https://bioconductor.org/packages/release/bioc/vignettes/ChIPseeker/inst/doc/ChIPseeker.html#session-information)




