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

# Script name: ISS_GO_bubble
# Created on: 30 January 2024
# Last updated: 14 May 2024
# Author: Neeraja Balasubrahmaniam
# Description: This script plots the bubble plot of enriched GO terms of growth 
# GO terms (Fig.4) and mitochondria related GO terms (Supplementary Fig.S2) in all
# pairwsie ERH comparisons.All enriched GO terms are provided in Supplementary Table S4.  
# Inkscape [v.1.3] (https://inkscape.org/) was used to finalize figures.

# ---- Setup for PCA -----------------------------------------------------------
# Install necessary packages
install.packages("tidyverse")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("hrbrthemes")
install.packages("viridis")
install.packages("ggh4x")
install.packages("grid")
install.packages("gridExtra")

# Load packages
library(tidyverse)
library(dplyr)
library(ggplot2)
library(hrbrthemes)
library(viridis)
library(ggh4x)
library(grid)
library(gridExtra)

# Package versions
packageVersion("tidyverse")
packageVersion("dplyr")
packageVersion("ggplot2")
packageVersion("hrbrthemes")
packageVersion("viridis")
packageVersion("ggh4x")
packageVersion("grid")
packageVersion("gridExtra")

# Reporting packages versions 
# > packageVersion("tidyverse")
# [1] ‘2.0.0’
# > packageVersion("dplyr")
# [1] ‘1.1.3’
# > packageVersion("ggplot2")
# [1] ‘3.4.3’
# > packageVersion("hrbrthemes")
# [1] ‘0.8.7’
# > packageVersion("viridis")
# [1] ‘0.6.3’
# > packageVersion("ggh4x")
# [1] ‘0.2.8’
# > packageVersion("grid")
# [1] ‘4.2.2’
# > packageVersion("gridExtra")
# [1] ‘2.3’

# Set working directory
setwd("")

# Read growth GO terms data
GO_all=read.table("GO_bubble_plot_data_HUMID.txt",header=T,row.names=NULL,sep="\t")
colnames(GO_all)=c("category","GO","GO_order", "RH", "RHgroup", "RHgroup_order", "-log10FDR", "Count")

# Plotting 
p1 = ggplot(GO_all, aes(x=factor(RH, levels = c("85% vs 50%", 
                                           "100% vs 50%",
                                           "100% vs 85%")) , 
                   y=reorder(GO,-GO_order), group = RHgroup, 
                   color = `-log10FDR`, size = Count)) +
  geom_point(alpha = 0.8) +
  scale_size(range = c(6, 20)) +
  xlab(NULL) +
  ylab(NULL) +
  scale_color_viridis(option="viridis", limits = c(1, 15), direction = -1, oob = scales::squish) +
  theme_bw() +
  theme(axis.text.x = element_text(size=15, color = "black", angle = 30, vjust = 1, hjust=0.9),
        axis.text.y = element_text(size=15, color = "black")) +
  facet_grid2(~ factor(RHgroup, levels=c('100%', '85%', '50%')), scales = "free_x", space='free',
              strip = strip_themed(
                background_x = list(element_rect(fill = "lightgrey"), element_rect(fill = "lightgrey"),
                                    element_rect(fill = "lightgrey")))) +
  theme(strip.background = element_blank(),
        strip.placement = "inside",
        strip.text = element_text(size=15, face = "bold", color = "black")) +
  scale_x_discrete(breaks = c("85% vs 50%", 
                              "100% vs 50%",
                              "100% vs 85%")) +
  
  theme(legend.text=element_text(size=13), legend.title = element_text(size=15))
p1

# Save plot as PDF
pdf(file = "GO_bubble_HUMID.pdf", width = 13, height = 6);
p1
dev.off()

# Read mitochondria GO terms data
GO_mito=read.table("GO_bubble_mitochondria_HUMID_X.txt",header=T,row.names=NULL,sep="\t")
colnames(GO_mito)=c("category","GO","GO_order", "RH", "RHgroup", "RHgroup_order", "-log10FDR", "Count")

# Plotting
p2 = ggplot(GO_mito, aes(x=factor(RH, levels = c("85% vs 50%", 
                                           "100% vs 50%",
                                           "100% vs 85%")) , 
                   y=reorder(GO,-GO_order), group = RHgroup, 
                   color = `-log10FDR`, size = Count)) +
  geom_point(alpha = 0.8) +
  scale_size(range = c(6, 20)) +
  xlab(NULL) +
  ylab(NULL) +
  scale_color_viridis(option="viridis", limits = c(1, 15), direction = -1, oob = scales::squish) +
  theme_bw() +
  theme(axis.text.x = element_text(size=15, color = "black", angle = 30, vjust = 1, hjust=0.9),
        axis.text.y = element_text(size=15, color = "black")) +
  facet_grid2(~ factor(RHgroup, levels=c('100%', '85%', '50%')), scales = "free_x", space='free',
              strip = strip_themed(
                background_x = list(element_rect(fill = "lightgrey"), element_rect(fill = "lightgrey"),
                                    element_rect(fill = "lightgrey")))) +
  theme(strip.background = element_blank(),
        strip.placement = "inside",
        strip.text = element_text(size=15, face = "bold", color = "black")) +
  scale_x_discrete(breaks = c("85% vs 50%", 
                              "100% vs 50%",
                              "100% vs 85%")) +
  
  theme(legend.text=element_text(size=13), legend.title = element_text(size=15))
p2

# Save plot as PDF
pdf(file = "GO_bubble_mitochondria_HUMID_X.pdf", width = 14, height = 6);
p2
dev.off()


