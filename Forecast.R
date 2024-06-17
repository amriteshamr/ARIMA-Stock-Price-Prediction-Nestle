library(quantmod)
library(forecast)
library(tseries)

getSymbols('IBM', from='2019-01-01', to='2023-01-01')
class(IBM)
#print(head(IBM))
IBM_Close_Prices <- Cl(IBM)

plot(IBM_Close_Prices, main = "IBM Closing Prices", xlab = "Date", ylab = "Closing Price", col = "red")

class(IBM_Close_Prices)

par(mfrow=c(1,2))
Acf(IBM_Close_Prices, main='ACF for Differenced Series')
Pacf(IBM_Close_Prices, main='PACF for Differenced Series')

print(adf.test(IBM_Close_Prices))
auto.arima(IBM_Close_Prices, seasonal = FALSE)

fit_A = auto.arima(IBM_Close_Prices, seasonal = FALSE) #ARIMA(1,1,4) with drift 
tsdisplay(residuals(fit_A), lag.max = 40, main = '(1,1,4) Model Residuals')
auto.arima(IBM_Close_Prices, seasonal = FALSE) #AIC/BIC = 4421.13/4455.54 (should be as low as possible)

fit_B = arima(IBM_Close_Prices, order = c(1,2,4)) #ARIMA(1,2,4) with drift 
tsdisplay(residuals(fit_B), lag.max = 40, main = '(1,2,4) Model Residuals')

fit_C = arima(IBM_Close_Prices, order = c(4,1,4)) #ARIMA(5,1,4) with drift 
tsdisplay(residuals(fit_B), lag.max = 40, main = '(5,1,4) Model Residuals')

fit_D = arima(IBM_Close_Prices, order = c(1,1,1)) #ARIMA(1,1,1) with drift 
tsdisplay(residuals(fit_B), lag.max = 40, main = '(1,1,1) Model Residuals')

par(mfrow=c(2,2))
term<-100
fcast1 <- forecast(fit_A, h=term)
plot(fcast1)
fcast2 <- forecast(fit_B, h=term)
plot(fcast2)
fcast3 <- forecast(fit_C, h=term)
plot(fcast3)
fcast4 <- forecast(fit_D, h=term)
plot(fcast4)

#Subtract MAPE from 100
accuracy(fcast1) #100 - 1.176621 = 98.823 %
accuracy(fcast2) #100 - 1.17729  = 98.822 %
accuracy(fcast3) #100 - 1.177147 = 98.822 %
accuracy(fcast4) #100 - 1.181095 = 98.818 %