setwd("J:Exploratory Data Analysis/workspace")
## I have placed the data set in the workspace
interim <- read.csv2("household_power_consumption.txt", dec =".")
#extract the required dates from the interim file
data <- subset(interim, interim$Date == "1/2/2007" | interim$Date == "2/2/2007")
# convert Global Active Power to a numeric field
data$Global_active_power <- as.character(data$Global_active_power)
data$Global_active_power <- as.numeric(data$Global_active_power)
# make a datetime field from the Date and Time in data
data$Date= as.character(data$Date)
data$Time= as.character(data$Time)
data$Datetime <- paste(data$Date, data$Time, sep=" ")
data$Datetime= strptime(data$Datetime,format = "%d/%m/%Y %H:%M:%S" )
# the dates must be in English
Sys.setlocale("LC_TIME", "English")
# set the size of the plot, and create it
png (filename = "plot2.png", height=480, width=480, units="px", res=72)
plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()