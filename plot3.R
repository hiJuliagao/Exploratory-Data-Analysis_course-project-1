# plot3

library(lubridate)

data <- read.table("household_power_consumption.txt", sep=";", head=T, stringsAsFactors = F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$full_date <- paste0(data$Date, " ", data$Time)
data$full_date <- as_datetime(data$full_date)
head(data)

# extract data

extract <- data[which(data$Date %in% as.Date(c("2007-02-01", "2007-02-02"))),]
head(extract)


# plot.  lwd in R stands for line width. plot means plot fig. lines means add line on plot. only one plot in a expression?

png(filename = "plot3.png", width = 480, height = 480)

with(extract, {
        plot(Sub_metering_1~full_date, type='l', xlab="", ylab="Global Active Power(kilowatts)")
        lines(Sub_metering_2~full_date, col="red")
        lines(Sub_metering_3~full_date, col="blue")
})
legend("topright", col=c("black", "red", "blue"), lwd=1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


