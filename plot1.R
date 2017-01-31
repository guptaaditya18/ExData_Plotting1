#data load, subset
getwd()
setwd("C:/Users/gupta/Documents/R/exdata%2Fdata%2Fhousehold_power_consumption")
power <- read.table("household_power_consumption.txt", TRUE, ";",stringsAsFactors=FALSE)
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- subset(power, power$Date >= "2007-02-01" & power$Date <= "2007-02-02")

#character to numeric
power$Global_active_power <- as.numeric(power$Global_active_power)

#graphic device, plot
png(filename = "plot1.png", width=480, height=480)
hist(power$Global_active_power, col = "red", main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", breaks = 15)
dev.off()