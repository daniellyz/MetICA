
## MetICA: Independent component analysis for high-resolution mass-spectrometry based non-targeted metabolomics

## Initialisation of MetICA:

source('MetICA_load_all.R')

## Example of application on yeast exo-metabolomics data:

# 1. Load and center dataset

new_data=data.matrix(read.table('Yeast-Experimental.txt',sep='\t',dec='.',header=T,check.names=FALSE))

new_data=new_data[2:nrow(new_data),2:ncol(new_data)]

row.names(new_data)=read.table('Yeast-Experimental.txt',sep='\t',dec='.',header=T)[2:(nrow(new_data)+1),1]

new_data_centered=scale(new_data,scale=F)

# 2. Estimation of sources from the whole training dataset with 800 random inputs, 90% variance was kept:

M1=MetICA_source_generator(new_data_centered,0.9,'gaussian',800) 

# 3. Clustering of estimated sources, evaluated from 2 to 18 clusters
# This step outputs three .txt files 'source_list.txt', 'cluster_labels.txt', 'distance.txt' for CCA visualization in metICA_CCA.m

M2=MetICA_cluster_generator(M1$S,'spearman',M1$IC)

# 4. Call matlab function from R to visualize the clusters:sq







