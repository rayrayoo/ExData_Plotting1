## Download and read data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "Electric_power_consumption.zip", method = "curl")
unzip("Electric_power_consumption.zip")
data <- read.table("household_power_consumption.txt", header = T, sep=";", na.strings = "?")

## Subset data from dates "2007-02-01" and "2007-02-02"
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Create a new variable recording date and time
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## open a png device
png("plot4.png")

## set a 2*2 layout
par(mfrow = c(2, 2))

## plot1
with(data, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))

## plot2
with(data, plot(datetime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))

## plot3
with(data, plot(datetime, Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "", ))
with(data, lines(datetime, Sub_metering_2, type = "l", col = "red" ))
with(data, lines(datetime, Sub_metering_3, type = "l", col = "blue" ))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))

## plot4
with(data, plot(datetime, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime"))

dev.off()


