data <- read.table(fileName, skip = 1, sep = ";", na.strings = "?")

names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

subData <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

subData$Date <- as.Date(subData$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subData$Date), subData$Time)
subData$Datetime <- as.POSIXct(datetime)

par(mfrow = c(2,2))

with(subData, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l",
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type= "l", ylab = "Energy sub metering", xlab = "")
  lines(x = subData$Datetime, y = subData$Sub_metering_2, col = "red")
  lines(x = subData$Datetime, y = subData$Sub_metering_3, col = "blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
         ,col=c("black", "red", "blue"), lty=c(1,1)
         , bty="n"
         , cex= 0.7)
  plot(Global_reactive_power~Datetime, type="l",
       ylab="Global_reactive_power", xlab="datetime")
})

dev.copy(png, file = "plot4.png", height = 480, width = 480)

dev.off()

