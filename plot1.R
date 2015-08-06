# Load data. Assuming the data file household_power_consumption.txt is in the current working directory
headerClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
powerConsumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses = headerClasses)

# include only 2007-02-01 and 2007-02-02 
dateInInterest <- as.Date(c("2007-02-01", "2007-02-02"), format = "%Y-%m-%d")
filteredData <- subset(powerConsumption,  as.Date(Date, "%d/%m/%Y") %in% dateInInterest,  select=c(Global_active_power))

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# Name each of the plot files as plot1.png
png("plot1.png", width = 480, height = 480, units = "px")
hist(filteredData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()