# plot 2

library(lubridate)

## read data
data <- read.table("household_power_consumption.txt", sep=";",header=T, stringsAsFactors = F)
head(data)

## create a full day/time column and convert it to POSIXct object
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$full_date <- paste0(data$Date, " ", data$Time)
data$full_date <- as_datetime(data$full_date) # convert an object to a date 
data <- data[,-11]

## extract data for the following days 2007-02-01, 2007-02-02
extract <- data[which(data$Date %in% as.Date(c("2007-02-01", "2007-02-02"))),]

## change column "Global Active Power" to numeric
extract$Global_active_power <- as.numeric(extract$Global_active_power)

## Plotting line plot-Global active power vs weekdays
png(filename="plot2.png", width=480, height=480)

with(extract, plot(Global_active_power~full_date, type='l', xlab="", ylab="Global Active Power(kilowatts)")) # the same

dev.off()

plot(extract$Global_active_power~extract$full_date, type='l', xlab="", ylab="Global Active Power(kilowatts)") # the same







