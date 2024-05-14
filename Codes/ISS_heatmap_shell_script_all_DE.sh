#!/bin/bash 

#SBATCH --nodes=1  

#SBATCH --ntasks-per-node=48 

#SBATCH --mem 177GB 

#SBATCH --time=5:00:00 

#SBATCH --job-name=Complex_Heatmap_all_DE_osc

#SBATCH --account=PAS1182 

#SBATCH --mail-type=ALL 

 

module load R/4.1.0-gnu9.1

R --slave <<EOF

#if (!require("BiocManager", quietly = TRUE))
 #   install.packages("BiocManager")

#BiocManager::install("ComplexHeatmap")

library(ComplexHeatmap)

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

# Set column names for all heatmaps
final_colnames = c("50% Bag1.1", "50% Bag1.2", "50% Bag1.3", "85% Bag1.1", "85% Bag1.3", "100% Bag1.1", 
                   "100% Bag1.2", "100% Bag1.3", "50% Bag2.3", "85% Bag2.1", "100% Bag2.1", "50% Bag3.3", 
                   "85% Bag3.1", "100% Bag3.1", "50% Bag4.1", "85% Bag4.1", "100% Bag 4.1", "100% Bag4.2",
                   "100% Bag4.3")
column_labels = structure(final_colnames, names = colnames(df4.numeric))

pdf(file = "HUMID_heatmap_all_genes.pdf", height = 10, width = 6)

p4 = Heatmap(df4.numeric, name = " ", cluster_columns = TRUE, cluster_rows = TRUE, 
             show_row_dend = FALSE, row_names_side = "left",
             col = col_fun4,
             show_row_names = FALSE,
             row_names_gp = gpar(fontsize = 16, fontfamily = "sans"),
             column_labels = column_labels[colnames(df4.numeric)],
             column_names_gp = gpar(fontsize = 15, fontfamily = "sans"),
             heatmap_legend_param = list(labels_gp = gpar(fontsize = 12, fontfamily = "sans")),
)
p4


dev.off()

EOF