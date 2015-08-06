library(dplyr)

# Load data. Assuming the data file household_power_consumption.txt is in the current working directory
headerClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
powerConsumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses = headerClasses)

# Include only 2007-02-01 and 2007-02-02 
dateInInterest <- c("1/2/2007", "2/2/2007")
filteredData <- subset(powerConsumption,  Date %in% dateInInterest) %>% within({ timestamp=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S") }) 


# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# Name each of the plot files as plot3.png
png("plot3.png", width = 480, height = 480, units = "px")
plot(filteredData$timestamp, filteredData$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col="black")
lines(filteredData$timestamp, filteredData$Sub_metering_2,col="red")
lines(filteredData$timestamp, filteredData$Sub_metering_3,col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(2.5,2.5, 2.5),col=c("black", "red", "blue"))
dev.off()