fileName <- "household_power_consumption.txt"
data <- read.table(fileName, skip = 1, sep = ";", na.strings = "?")

names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

subData <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

subData$Global_active_power <- as.numeric(subData$Global_active_power)


subData$Date <- as.Date(subData$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subData$Date), subData$Time)
subData$Datetime <- as.POSIXct(datetime)

head(subData$Datetime)

with(subData, 
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
)

dev.copy(png, file = "plot2.png", width = 480, height = 480)

dev.off()