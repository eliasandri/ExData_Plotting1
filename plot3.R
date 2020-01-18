fileName <- "household_power_consumption.txt"
data <- read.table(fileName, skip = 1, sep = ";", na.strings = "?")

names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

subData <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

subData$Date <- as.Date(subData$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subData$Date), subData$Time)
subData$Datetime <- as.POSIXct(datetime)

with(subData, {
  plot(Sub_metering_1~Datetime, type= "l", ylab = "Energy sub metering", xlab = "")
  lines(x = subData$Datetime, y = subData$Sub_metering_2, col = "red")
  lines(x = subData$Datetime, y = subData$Sub_metering_3, col = "blue")
})

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       ,col=c("black", "red", "blue"), lty=1, lwd=2)

dev.copy(png, file = "plot3.png", height = 480, width = 480)

dev.off()
