fileName <- "household_power_consumption.txt"

data <- read.table(fileName, skip = 1, sep = ";")

names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

subData <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

png(filename = "plot1.png", width = 480, height = 480)

subData$Global_active_power <- as.numeric(as.character(subData$Global_active_power))

hist(subData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")



dev.off()