setwd("J:Exploratory Data Analysis/workspace")
#read data
interim <- read.csv2("household_power_consumption.txt", dec =".")
# select the required dates
data <- subset(interim, interim$Date == "1/2/2007" | interim$Date == "2/2/2007")
# create a date/time column
data$Date= as.character(data$Date)
data$Time= as.character(data$Time)
data$Datetime <- paste(data$Date, data$Time, sep=" ")
data$Datetime= strptime(data$Datetime,format = "%d/%m/%Y %H:%M:%S" )
# set the required columns to numeric
data$Sub_metering_1 <- as.character(data$Sub_metering_1)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.character(data$Sub_metering_2)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.character(data$Sub_metering_3)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
# the dates must be in English
Sys.setlocale("LC_TIME", "English")
# create the file with the plot
png (filename = "plot3.png", height=480, width=480, units="px", res=72)
plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines (data$Datetime, data$Sub_metering_2, col = "red")
lines (data$Datetime, data$Sub_metering_3, col = "blue")
legend ("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))
ylab = "Global Active Power (kilowatts)"
dev.off()