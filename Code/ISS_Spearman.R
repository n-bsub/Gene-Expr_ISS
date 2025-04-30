################################################################################
#
#   Fungal gene expression in dust from the International Space Station (ISS)
#                      
#       Balasubrahmaniam et al 2024. Exposure to elevated relative humidity
#        in laboratory chambers alters fungal gene expression in dust from 
#                the International Space Station (ISS).
#
#                       By: Neeraja Balasubrahmaniam
#
################################################################################

# Script name: ISS_Spearman
# Created on: 31 March 2024
# Last updated: 14 May 2024
# Author: Neeraja Balasubrahmaniam
# Modified from codes used in Trinity RNAseq Differential Expression pipeline: 
# https://github.com/trinityrnaseq/trinityrnaseq/tree/master/Analysis/DifferentialExpression
# Description: This script performs Spearman correlation of differentially 
# expressed genes and plots as a heatmap (Supplementary Fig.S1). 
# The script was modified from the R script in Trinity's pipeline.
# Inkscape [v.1.3] (https://inkscape.org/) was used to finalize figure and modify figure labels.

# ---- Setup for PCA -----------------------------------------------------------

install.packages("cluster")
install.packages("Biobase")
install.packages("qvalue")
install.packages("fastcluster")
install.packages("gplots")
install.packages("devtools")

library(cluster)
library(Biobase)
library(qvalue)
library(fastcluster)
library(gplots)
library(devtools)

# Package versions
packageVersion("cluster")
packageVersion("Biobase")
packageVersion("qvalue")
packageVersion("fastcluster")
packageVersion("gplots")
packageVersion("devtools")


# Reporting packages versions 
# > packageVersion("cluster")
# [1] ‘2.1.4’
# > packageVersion("Biobase")
# [1] ‘2.58.0’
# > packageVersion("qvalue")
# [1] ‘2.30.0’
# > packageVersion("fastcluster")
# [1] ‘1.2.3’
# > packageVersion("gplots")
# [1] ‘3.1.3’
# > packageVersion("devtools")
# [1] ‘2.4.5’’

#Load latest version of heatmap.3 function
source_url("https://raw.githubusercontent.com/obigriffith/biostar-tutorials/master/Heatmaps/heatmap.3.R")

options(stringsAsFactors = FALSE)
NO_REUSE = F

sample_matrix_to_color_assignments = function(sampleAnnotationsMatrix, colors) {
  
  if (missing(colors))
    colors = rainbow(nrow(sampleAnnotationsMatrix))
  
  nsamples = nrow(sampleAnnotationsMatrix);
  
  if (length(colors) < nrow(sampleAnnotationsMatrix))
    stop("Error, only ", length(colors), " colors specified, but have ", nsamples, " samples");
  
  for (i in 1:nrow(sampleAnnotationsMatrix)) {
    c = colors[i]
    sampleAnnotationsMatrix[i,] = sapply(sampleAnnotationsMatrix[i,], function(x) ifelse( x, as.character(c), 'white'))
  }
  
  return(sampleAnnotationsMatrix);
  
}

primary_data = readRDS("diffExpr.P1e-2_C2.matrix.RDS")
data = primary_data
myheatcol = colorpanel(75, 'red','white','darkblue')
sample_types = colnames(data)
nsamples = length(sample_types)
sample_colors = rainbow(nsamples)
sample_type_list = list()
for (i in 1:nsamples) {
  sample_type_list[[sample_types[i]]] = sample_types[i]
}
sample_factoring = colnames(data)
for (i in 1:nsamples) {
  sample_type = sample_types[i]
  replicates_want = sample_type_list[[sample_type]]
  sample_factoring[ colnames(data) %in% replicates_want ] = sample_type
}
initial_matrix = data # store before doing various data transformations
data = log2(data+1)
sample_factoring = colnames(data)
for (i in 1:nsamples) {
  sample_type = sample_types[i]
  replicates_want = sample_type_list[[sample_type]]
  sample_factoring[ colnames(data) %in% replicates_want ] = sample_type
}
sampleAnnotations = matrix(ncol=ncol(data),nrow=nsamples)
for (i in 1:nsamples) {
  sampleAnnotations[i,] = colnames(data) %in% sample_type_list[[sample_types[i]]]
}
sampleAnnotations = apply(sampleAnnotations, 1:2, function(x) as.logical(x))
sampleAnnotations = sample_matrix_to_color_assignments(sampleAnnotations, col=sample_colors)
rownames(sampleAnnotations) = as.vector(sample_types)
colnames(sampleAnnotations) = colnames(data)
data = as.matrix(data) # convert to matrix

# Centering rows
data = t(scale(t(data), scale=F))

if (nrow(data) < 2) { stop("

**** Sorry, at least two rows are required for this matrix.

");}
if (ncol(data) < 2) { stop("

**** Sorry, at least two columns are required for this matrix.

");}
sample_cor = cor(data, method='spearman', use='pairwise.complete.obs') # Spearman correlation
sample_dist = dist(t(data), method='euclidean')
hc_samples = hclust(sample_dist, method='complete')

# Plotting
pdf("Spearman_HUMID_test.pdf")
sample_cor_for_plot = sample_cor
if (is.null(hc_samples)) { RowV=NULL; ColV=NULL} else { RowV=as.dendrogram(hc_samples); ColV=RowV }
heatmap.3(sample_cor_for_plot, dendrogram='both', Rowv=RowV, Colv=ColV, col = myheatcol, scale='none', symm=TRUE, key=TRUE,density.info='none', trace='none', symkey=FALSE, symbreaks=F, margins=c(10,10), cexCol=1, cexRow=1, cex.main=0.75)
dev.off()
