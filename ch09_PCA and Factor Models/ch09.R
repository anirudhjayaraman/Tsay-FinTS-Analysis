### Chapter 09 - PCA and Factor Models ########################################

# if(!("FinTS" %in% rownames(installed.packages()))) install.packages("FinTS")
library(FinTS)
library(zoo)

## source data from Ch 9 ######################################################
# https://www.rdocumentation.org/packages/FinTS/versions/0.4-5/topics/ch09data
source(file.path("F:","2019","Tsay","data","ch09data.R"), echo = TRUE)

View(m.fac9003)
class(m.fac9003) # zoo object

