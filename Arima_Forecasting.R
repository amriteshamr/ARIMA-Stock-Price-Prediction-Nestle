# library(readr)
# library(ggplot2)
# library(forecast)
# library(tseries)
# library(lubridate)

# file_path <- "C:/Users/amrit/OneDrive/Desktop/Stock Price/nestle.csv"
# data <- read_csv(file_path, show_col_types = FALSE)

# data$Date <- as.Date(data$Date, format="%d-%B-%Y")
# data <- data[order(data$Date), ]
# data_ts <- ts(data$`Close Price`, start=c(year(min(data$Date)), month(min(data$Date))), frequency=365)

# plot(data$Date, data$`Close Price`, type="l", col="blue", lwd=2, xlab="Date", ylab="Close Price", main="Close Price Over Time")

# adf_test_result <- adf.test(data_ts)
# print(adf_test_result) #p-Value = 0.6177 > 0.05 Therefore, we have to do differencing

# If p-value > 0.05, difference the series and test again
# if (adf_test_result$p.value > 0.05) {
#   data_ts_diff <- diff(data_ts)
#   adf_test_result_diff <- adf.test(data_ts_diff)
#   print(adf_test_result_diff)
#   
#   # Use differenced data for ARIMA if it's stationary
#   if (adf_test_result_diff$p.value <= 0.05) {
#     data_ts <- data_ts_diff
#   } else {
#     stop("The differenced series is not stationary.")
#   }
# }

# Plot ACF and PACF to identify potential p and q using base R plotting functions
# par(mfrow=c(1,2))
# acf(data_ts, main="ACF of Close Price")
# pacf(data_ts, main="PACF of Close Price")

# Automatically select the best ARIMA model using auto.arima
best_model <- auto.arima(data_ts)
summary(best_model)