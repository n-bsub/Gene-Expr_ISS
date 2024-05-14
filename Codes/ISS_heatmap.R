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

# Script name: ISS_heatmap
# Created on: 24 February 2024
# Last updated: 05 May 2024
# Author: Neeraja Balasubrahmaniam
# Description: This script plots the gene expression of fungal allergens (Fig.5), 
# aflatoxins (Fig.6), secondary metabolites (Fig.3b) and all differentially 
# expressed genes (Fig.3a) on a heatmap. 
# TMM normalized CPM (Counts Per Million) values that are log2 transformed and 
# row mean-centered were used to plot the heatmap.
# Inkscape [v.1.3] (https://inkscape.org/) was used to finalize figures.

# ---- Setup -------------------------------------------------------------------

# Install packages
if (!requireNamespace("BiocManager", quietly=TRUE))
  install.packages("BiocManager")
BiocManager::install("ComplexHeatmap")
install.packages("circlize")

# Load packages
library(ComplexHeatmap)
library(circlize)

# Package version
packageVersion("ComplexHeatmap")

# Report package version
# > packageVersion("ComplexHeatmap")
# [1] ‘2.15.1’

# Set working directory
setwd("")

# Read data for fungal allergen genes
data=read.table(file="Allergen_heatmap_data_X.txt", header = FALSE, sep='	'); 
df <- data.frame(data[,-1])

colnames(df) <-  make.unique(as.character(df[1,]))
rownames(df) <- df[,1]
df <- df[,-1]
df <- df[-1,]

df.matrix = as.matrix(df)
df.numeric = matrix(as.numeric(df.matrix),    # Convert to numeric matrix
                    ncol = ncol(df.matrix))

colnames(df.numeric) <- colnames(df)
rownames(df.numeric) <- rownames(df)


df.numeric = log2(df.numeric+1) # log transform
df.numeric = t(scale(t(df.numeric), scale=F)) # row mean centering

# color scale for allergen heatmap
col_fun = colorRamp2(c(min(df.numeric), mean(df.numeric), 
                       max(df.numeric)), c("red","white","darkblue"))
col_fun(seq(-3, 3))

# Read data for aflatoxin genes
data2=read.table(file="aflatoxin_genes_X.txt", header = FALSE, sep='	');
df2 <- data.frame(data2[,-(1:2)])

colnames(df2) <-  make.unique(as.character(df2[1,]))
rownames(df2) <- df2[,1]
df2 <- df2[,-1]
df2 <- df2[-1,]

df2.matrix = as.matrix(df2)
df2.numeric = matrix(as.numeric(df2.matrix),    # Convert to numeric matrix
                    ncol = ncol(df2.matrix))

colnames(df2.numeric) <- colnames(df2)
rownames(df2.numeric) <- rownames(df2)

df2.numeric = log2(df2.numeric+1) # log transform
df2.numeric = t(scale(t(df2.numeric), scale=F)) # row mean centering

col_fun2 = colorRamp2(c(min(df2.numeric), mean(df2.numeric), 
                       max(df2.numeric)), c("red","white","darkblue"))
col_fun2(seq(-3, 3)) # color scale for aflatoxin heatmap

# Read data for fungal secondary metabolite genes
data3=read.table(file="Sec_met_X.txt", header = FALSE, sep='	');
df3 <- data.frame(data3)

colnames(df3) <-  make.unique(as.character(df3[1,]))
rownames(df3) <- df3[,1]
df3 <- df3[,-1]
df3 <- df3[-1,]

df3.matrix = as.matrix(df3)
df3.numeric = matrix(as.numeric(df3.matrix),    # Convert to numeric matrix
                     ncol = ncol(df3.matrix))

colnames(df3.numeric) <- colnames(df3)
rownames(df3.numeric) <- rownames(df3)

df3.numeric = log2(df3.numeric+1) # log transform
df3.numeric = t(scale(t(df3.numeric), scale=F)) # row mean cenetring

col_fun3 = colorRamp2(c(min(df3.numeric), mean(df3.numeric), 
                        max(df3.numeric)), c("red","white","darkblue"))
col_fun3(seq(-3, 3)) # color scale for secondary metabolite heatmap

# Set column names for all heatmaps
final_colnames = c("50% Bag1.1", "50% Bag1.2", "50% Bag1.3", "85% Bag1.1", "85% Bag1.3", "100% Bag1.1", 
                   "100% Bag1.2", "100% Bag1.3", "50% Bag2.3", "85% Bag2.1", "100% Bag2.1", "50% Bag3.3", 
                   "85% Bag3.1", "100% Bag3.1", "50% Bag4.1", "85% Bag4.1", "100% Bag 4.1", "100% Bag4.2",
                   "100% Bag4.3")
column_labels = structure(final_colnames, names = colnames(df.numeric))

# Plotting allergen heatmap
p1 = Heatmap(df.numeric, name = " ", cluster_columns = TRUE, cluster_rows = TRUE, 
             show_row_dend = FALSE, row_names_side = "left",
             col = col_fun,
             show_row_names = TRUE,
             row_names_gp = gpar(fontsize = 16, fontfamily = "sans"),
             column_labels = column_labels[colnames(df.numeric)],
             column_names_gp = gpar(fontsize = 15, fontfamily = "sans"),
             heatmap_legend_param = list(labels_gp = gpar(fontsize = 12, fontfamily = "sans")),
)
p1

# Plotting aflatoxin heatmap
pdf(file = "HUMID_heatmap_aflatoxin_genes.pdf", height = 5, width = 7)

p2 = Heatmap(df2.numeric, name = " ", cluster_columns = TRUE, cluster_rows = TRUE, 
             show_row_dend = FALSE, row_names_side = "left",
             col = col_fun2,
             show_row_names = TRUE,
             row_names_gp = gpar(fontsize = 16, fontfamily = "sans"),
             column_labels = column_labels[colnames(df.numeric)],
             column_names_gp = gpar(fontsize = 15, fontfamily = "sans"),
             heatmap_legend_param = list(labels_gp = gpar(fontsize = 12, fontfamily = "sans")),
)
p2

# Plotting secondary metabolite heatmap
p3 = Heatmap(df3.numeric, name = " ", cluster_columns = TRUE, cluster_rows = TRUE, 
             show_row_dend = FALSE, #row_names_side = "left",
             col = col_fun3,
             show_row_names = FALSE,
             #row_names_gp = gpar(fontsize = 16, fontfamily = "sans"),
             column_labels = column_labels[colnames(df.numeric)],
             column_names_gp = gpar(fontsize = 15, fontfamily = "sans"),
             heatmap_legend_param = list(labels_gp = gpar(fontsize = 12, fontfamily = "sans")),
)
p3

# Heatmap for all DE genes: This code was run on a shell script on 
# the Ohio Supercomputer cluster since we needed the additional computational 
# resources for this larger input matrix and heatmpa plotting. Separate shell  
# script is included in the GitHub folder. Running below on a laptop may take
# time and running on a machine that has high computational power is highly
# recommended.

# Read data for all differentially expressed genes
data4=readRDS("diffExpr.P1e-2_C2.matrix.RDS") # load input matrix

df4 <- data.frame(data4)

df4.matrix = as.matrix(df4)
df4.numeric = matrix(as.numeric(df4.matrix),    # Convert to numeric matrix
                    ncol = ncol(df4.matrix))

colnames(df4.numeric) <- colnames(df4)
rownames(df4.numeric) <- rownames(df4)

df4.numeric = log2(df4.numeric+1) # log transform
df4.numeric = t(scale(t(df4.numeric), scale=F)) # row mean cenetring

col_fun4 = colorRamp2(c(min(df4.numeric), mean(df4.numeric), 
                        max(df4.numeric)), c("red","white","darkblue"))
col_fun4(seq(-3, 3)) # Set color scale for heatmap

# Plot heatmap of all differentially expressed gene expression
p4 = Heatmap(df4.numeric, name = " ", cluster_columns = TRUE, cluster_rows = TRUE, 
             show_row_dend = FALSE, row_names_side = "left",
             col = col_fun4,
             show_row_names = FALSE,
             row_names_gp = gpar(fontsize = 16, fontfamily = "sans"),
             column_labels = column_labels[colnames(df.numeric)],
             column_names_gp = gpar(fontsize = 15, fontfamily = "sans"),
             heatmap_legend_param = list(labels_gp = gpar(fontsize = 12, fontfamily = "sans")),
)
p4

# Save plots as PDF
pdf(file = "HUMID_heatmap_allergen_genes_X.pdf", height = 6, width = 8)
p1
dev.off()

pdf(file = "HUMID_heatmap_aflatoxin_genes1.pdf", height = 5, width = 7)
p2
dev.off()

pdf(file = "HUMID_Sec_met_genes.pdf", height = 10, width = 6)
p3
dev.off()

pdf(file = "HUMID_heatmap_all_genes.pdf", height = 10, width = 6)
p4
dev.off()

