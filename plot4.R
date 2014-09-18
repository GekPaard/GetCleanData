setwd("J:Exploratory Data Analysis/workspace")
interim <- read.csv2("household_power_consumption.txt", dec =".")
#select the required dates
data <- subset(interim, interim$Date == "1/2/2007" | interim$Date == "2/2/2007")
## create a datetime column in data
data$Date     <- as.character(data$Date)
data$Time     <- as.character(data$Time)
data$Datetime <- paste(data$Date, data$Time, sep=" ")
data$Datetime <- strptime(data$Datetime,format = "%d/%m/%Y %H:%M:%S" )
# make the columns for the plot numeric
data$Global_active_power   <- as.character(data$Global_active_power)
data$Global_active_power   <- as.numeric(data$Global_active_power)
data$Sub_metering_1        <- as.character(data$Sub_metering_1)
data$Sub_metering_1        <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2        <- as.character(data$Sub_metering_2)
data$Sub_metering_2        <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3        <- as.character(data$Sub_metering_3)
data$Sub_metering_3        <- as.numeric(data$Sub_metering_3)
data$Voltage               <- as.character(data$Voltage)
data$Voltage               <- as.numeric(data$Voltage)
data$Global_reactive_power <- as.character(data$Global_reactive_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
# the dates must be in English
Sys.setlocale("LC_TIME", "English")
# create the plots
png (filename = "plot4.png", height=480, width=480, units="px", res=72)
par(mfcol=c(2,2))
#plot for Global active power
plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
# plot for sub meetering
plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines (data$Datetime, data$Sub_metering_2, col = "red")
lines (data$Datetime, data$Sub_metering_3, col = "blue")
legend ("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"), bty ="n")
ylab = "Global Active Power (kilowatts)"
#plot for Voltage
plot(data$Datetime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#plot for Global reactive Power
plot(data$Datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()