## Loading all necessary packages and files before running the program.

packages <- c("fastICA", "MASS", "e1071", "R.matlab")

for (p in 1:4){
  x=packages[p]
  if (!require(x,character.only = TRUE))
  {
    install.packages(x,dep=TRUE)
  } 
}

library(fastICA)
library(MASS)
library(e1071)
library(R.matlab)

source('MetICA_fastICA.R')
source('MetICA_simulated_generator.R')
source('MetICA_source_generator.R')
source('MetICA_cluster_generator.R')
source('MetICA_cluster_center.R')
source('MetICA_bootstrap.R')
source('MetICA_consistent.R')

t=as.numeric(Sys.time())
set.seed((t - floor(t))*1e8->seed)