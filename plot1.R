## Download and read data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "Electric_power_consumption.zip", method = "curl")
unzip("Electric_power_consumption.zip")
data <- read.table("household_power_consumption.txt", header = T, sep=";", na.strings = "?")

## Convert the Date variable to data type
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subset data from dates "2007-02-01" and "2007-02-02"
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

## plot histogram of Global Active Power into a png file
png("plot1.png")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()



