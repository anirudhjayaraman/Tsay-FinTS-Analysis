### Chapter 08 - Multivariate Time Series Analysis and its Applications #######
# remove environment data and values
rm(list = ls())
 
library(FinTS) # source datasets for this exercise 
library(zoo) # time series
library(urca) # for cointegration
library(lubridate) # to add date
library(magrittr) # to use chaining %>%
library(forecast) # to use auto.arima

# Set working directory
setwd(file.path("C:","git","Tsay-FinTS-Analysis","ch08"))

# Load the source datasets 
bhp <- read.table("d-bhp0206.txt", header = T, stringsAsFactors = F)
vale <- read.table("d-vale0206.txt", header = T, stringsAsFactors = F)

# Examine the data
head(bhp); tail(bhp)
head(vale); tail(vale)

# Add date columns (shown 2 ways)
bhp$date <- as.Date(with(bhp, paste(year, Mon, day,sep="-")), "%Y-%m-%d")
vale$date <- paste(vale$year, vale$Mon, vale$day, sep="-") %>% ymd() %>% as.Date()

# Plot both time series
par(mfrow = c(2,1))
plot.zoo(zoo(bhp$adjclose,order.by = bhp$date), col = 'blue', ylab = "BHP")
plot.zoo(zoo(vale$adjclose, order.by = vale$date), col = 'red', ylab = "VALE" )
par(mfrow = c(1,1))

# Examine correlations between the 2 variables
cor(vale$adjclose, bhp$adjclose) # 0.9894316

# Examine linear relationship between the two log-series
lin_relation_bhp_vale <- lm(log(bhp$adjclose) ~ log(vale$adjclose))
summary(lin_relation_bhp_vale)

# Fitting an ARIMA model on the residuals of this regression
auto.arima(lin_relation_bhp_vale$residual) # ARMA(1,1)
arima_model <- arima(lin_relation_bhp_vale$residuals, order = c(1,0,1), 
                     include.mean = F)
summary(arima_model)

## Johansen Procedure
# Eigen test
eig_test <- ca.jo(xt, ecdet = 'const', type = 'eigen', K = 2, spec = 'transitory')
summary(eig_test)

# Trace test
trace_test <- ca.jo(xt, ecdet = 'const', type = 'trace', K = 2, spec = 'transitory')
summary(trace_test)
