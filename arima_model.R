#library(readr)
#library(ggplot2)
#library(forecast)
#library(tseries)
#library(lubridate)


#file_path <- "C:/Users/amrit/OneDrive/Desktop/Stock Price/nestle.csv"
#data <- read_csv(file_path, show_col_types = FALSE)

#data$Date <- as.Date(data$Date, format="%d-%B-%Y")
#data <- data[order(data$Date), ]
#data_ts <- ts(data$`Close Price`, start=c(year(min(data$Date)), month(min(data$Date))), frequency=365)


#plot(data$Date, data$`Close Price`, type="l", col="blue", lwd=2, xlab="Date", ylab="Close Price", main="Close Price Over Time")

# Check for stationarity
#adf_test_result <- adf.test(data_ts)
#print(adf_test_result)

data_ts_diff <- diff(data_ts)
plot(data_ts_diff, type="l", col="blue", lwd=2, xlab="Date", ylab="Differenced Close Price", main="Differenced Close Price Over Time")
adf_test_diff_result <- adf.test(data_ts_diff)
print(adf_test_diff_result)
# Plot ACF and PACF to identify potential p and q using base R plotting functions
#par(mfrow=c(1,2))
#acf(data_ts, main="ACF of Close Price")
#pacf(data_ts, main="PACF of Close Price")

# Automatically select the best ARIMA model using auto.arima
#best_model <- auto.arima(data_ts)
#summary(best_model)

# Fit the ARIMA model with the selected order
#arima_model <- arima(data_ts, order=c(best_model$arma[1], best_model$arma[6], best_model$arma[2]))

#summary(arima_model)

# Generate future predictions
#forecast_steps <- 30
#forecast <- forecast(arima_model, h=forecast_steps)

#plot(forecast, main="Stock Price Prediction", xlab="Date", ylab="Close Price")
#lines(data_ts, col="blue", lwd=2)

#accuracy(forecast)

#subset_length <- 90
#data_subset <- tail(data, subset_length)
