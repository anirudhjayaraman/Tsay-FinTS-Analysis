### Chapter 09 - PCA and Factor Models ########################################
rm(list = ls())
if(!("FinTS" %in% rownames(installed.packages()))) install.packages("FinTS") 
library(FinTS)
library(zoo)

# Set working directory
setwd(file.path("C:","git","Tsay-FinTS-Analysis"))

# Load the source datasets for Ch 9
source(file.path("data","ch09data.R"), echo = TRUE)

# check data type dataframe/zoo, etc.
dat <- m.5cln
class(dat) # zoo object

# Perform PCA on data
pca_cov <- princomp(dat)
summary(pca_cov)
pca_cov$sdev
pca_cov$scores
pca_cov$call
pca_cov$center
pca_cov$scale

# Factor Loadings
pca_cov$loadings


# Scree plot
screeplot(pca_cov)




