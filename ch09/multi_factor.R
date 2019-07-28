### Chapter 09 - PCA and Factor Models ########################################
rm(list = ls())
if(!("FinTS" %in% rownames(installed.packages()))) install.packages("FinTS") 
library(FinTS)
library(zoo)

# Set working directory
setwd(file.path("F:","2019","Tsay-FinTS-Analysis"))

# Load the source datasets for Ch 9
source(file.path("data","ch09data.R"), echo = TRUE)

# check data type dataframe/zoo, etc.
dat <- m.cpice16.dp7503 # store m.cpice16.dp7503 dataset as 'dat'
class(dat) # zoo object

# check time series range
head(dat) # Jan 1975 onwards monthly
tail(dat) # Dec 2002

# Store the dataset as a matrix
dat_matrix <- as.matrix(dat)

# Store the dataset as an R dataframe
dat_df <- data.frame(dat_matrix)





