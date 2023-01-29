# plot 4
library(lubridate)

data <- read.table("household_power_consumption.txt", sep=";", header = T, stringsAsFactors = F)
head(data)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$full_date <- paste0(data$Date, " ", data$Time)
data$full_date <- as_datetime(data$full_date)
head(data)

## extract
extract <- data[which(data$Date %in% as.Date(c("2007-02-01", "2007-02-02"))),]
head(extract)

## plot fig

png("plot4.png", width=480, height=480)

par(mfrow=c(2, 2))

with(extract, plot(Global_active_power~full_date, type='l', xlab="", ylab = "Global Active Power"))

with(extract, plot(Voltage~full_date, type='l', xlab="datetime", ylab="Voltage"))

with(extract, {
        plot(Sub_metering_1~full_date, type='l', xlab="", ylab="Global Active Power")
        lines(Sub_metering_2~full_date, col="red")
        lines(Sub_metering_3~full_date, col="blue")
})
legend("topright", col=c("black", "red", "blue"), lwd=1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(extract, plot(Global_reactive_power~full_date, type='l', xlab="datetime", ylab="Global_reactive_power"))
dev.off()












