#data load, subset
setwd("C:/Users/gupta/Documents/R")
power <- read.table("household_power_consumption.txt", TRUE, ";",stringsAsFactors=FALSE, dec=".")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- subset(power, power$Date >= "2007-02-01" & power$Date <= "2007-02-02")

#character to numeric
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

#combine date and time
datetime <- paste(as.Date(power$Date), power$Time)
power$Datetime <- as.POSIXct(datetime)

#graphic device, plot
png(filename = "plot3.png", width=480, height=480)
plot(Sub_metering_1~Datetime, data = power, type = "l", ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2~Datetime, data = power, type = "l", col = "red")
lines(Sub_metering_3~Datetime, data = power, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()
