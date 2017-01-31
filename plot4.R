#data load, subset
setwd("C:/Users/gupta/Documents/R")
power <- read.table("household_power_consumption.txt", TRUE, ";", stringsAsFactors=FALSE)
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- subset(power, power$Date >= "2007-02-01" & power$Date <= "2007-02-02")

#character to numeric
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

#combine date and time
datetime1 <- paste(as.Date(power$Date), power$Time)
power$Datetime <- as.POSIXct(datetime1)

#graphic device
png(filename = "plot4.png", width=480, height=480)
par(mfrow = c(2,2))
#topleft plot

plot(Global_active_power~Datetime, data = power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
#topright plot
plot(Voltage~Datetime, data = power, type = "l", ylab = "Voltage", xlab = "")
#bottomleft plot
plot(Sub_metering_1~Datetime, data = power, type = "l", ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2~Datetime, data = power, type = "l", col = "red")
lines(Sub_metering_3~Datetime, data = power, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty = "n")

plot(Global_reactive_power~Datetime, data = power, type = "l", ylab = "Global_reactive_power", xlab = "")

dev.off()

