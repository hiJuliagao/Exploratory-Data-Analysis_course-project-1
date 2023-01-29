# Plot1 

## import data and convert the TXT file to csv file. 

write.csv(household_power_consumption, "convert2.csv", row.names = FALSE, quote=FALSE)

a <- household_power_consumption

Plot1 <- as.numeric(a$V3)

png(file="plot1.png", width = 480, height = 480)
hist(Plot1, col="red", xlab="Global Active Power(kilowatts)", main ="Global Active Power")
dev.off()
