setwd("J:Exploratory Data Analysis/workspace")
## The separation character is ";", so I use read.csv2
interim <- read.csv2("household_power_consumption.txt")
## Extract the desired dates
data <- subset(interim, interim$Date == "1/2/2007" | interim$Date == "2/2/2007")
## Global_active_power is a factor, change this to numeric
data$Global_active_power= as.character(data$Global_active_power)
data$Global_active_power= as.numeric(data$Global_active_power)
##set the size of the plot, and create it
png (filename = "plot1.png", height=480, width=480, units="px", res=72)
hist(data$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()