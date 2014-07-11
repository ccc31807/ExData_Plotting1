#   Namne:      plot3.R
#   Author:     Charles Carter
#   Date:       July 11, 2014

hpc <- read.csv("household_power_consumption.txt", sep = ';', stringsAsFactors = F)
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc1 <- subset(hpc, hpc$Date > "2007-1-31" & hpc$Date < "2007-2-3")
hpc1$DateTime <- paste(hpc1$Date, hpc1$Time, sep = ' ')
hpc1$DateTime <- strptime(hpc1$DateTime, "%Y-%m-%d %H:%M:%S")
hpc1$Global_active_power <- as.numeric(hpc1$Global_active_power)
hpc1$Sub_metering_1 <- as.numeric(hpc1$Sub_metering_1)
hpc1$Sub_metering_2 <- as.numeric(hpc1$Sub_metering_2)
hpc1$Sub_metering_3 <- as.numeric(hpc1$Sub_metering_3)
hpc1$Voltage <- as.numeric(hpc1$Voltage)
hpc1$Global_reactive_power <- as.numeric(hpc1$Global_reactive_power)


#-------------- part 3 ---------------------
png('plot3.png')
plot(hpc1$DateTime, hpc1$Sub_metering_1, col = 'black', type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(hpc1$DateTime, hpc1$Sub_metering_2, col = 'red', type = 'l')
lines(hpc1$DateTime, hpc1$Sub_metering_3, col = 'blue', type = 'l')
legend('topright', border = 'black', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = 1)
dev.off()
rm(hpc)
rm(hpc1)
cat("printed plot3.png\n")
