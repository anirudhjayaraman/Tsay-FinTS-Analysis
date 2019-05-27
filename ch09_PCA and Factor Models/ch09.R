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
dat <- m.fac9003 # store m.fac9003 dataset as 'dat'
class(dat) # zoo object

# check time series range
head(dat) # Jan 1990 onwards monthly
tail(dat) # Dec 2003

# Store the dataset as a matrix
dat_matrix <- as.matrix(dat)

# Sovle a system of equations with S&P500 as factor
X <- cbind(rep(1,nrow(dat)),dat_matrix[,"SP5"])
y <- dat_matrix[,-ncol(X)]

# Estimates
beta_hat <- solve(t(X) %*% X) %*% t(X) %*% y # (X'X)^-1 X'y
y_hat <- X %*% beta_hat 
e_hat <- y - y_hat 
d_hat <- (nrow(X) - nrow(beta_hat))^-1 * diag(diag(e_hat %*% t(e_hat)))



