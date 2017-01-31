#data load, subset
setwd("C:/Users/gupta/Documents/R")
power <- read.table("household_power_consumption.txt", TRUE, ";",stringsAsFactors=FALSE, dec=".")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- subset(power, power$Date >= "2007-02-01" & power$Date <= "2007-02-02")

#character to numeric
power$Global_active_power <- as.numeric(power$Global_active_power)

#combine date and time
datetime <- paste(as.Date(power$Date), power$Time)
power$Datetime <- as.POSIXct(datetime)

#graphic device, plot
png(filename = "plot2.png", width=480, height=480)
plot(Global_active_power~Datetime, data = power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
