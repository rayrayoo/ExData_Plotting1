## Download and read data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "Electric_power_consumption.zip", method = "curl")
unzip("Electric_power_consumption.zip")
data <- read.table("household_power_consumption.txt", header = T, sep=";", na.strings = "?")

## Subset data from dates "2007-02-01" and "2007-02-02"
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Create a new variable recording date and time
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## plot Global Active Power with datetime into a png file
png("plot2.png")
with(data, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()




