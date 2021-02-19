##Load data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
#We will only be using data from the dates 2007-02-01 and 2007-02-02
subSetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
subSetData$Date <- as.Date(subSetData$Date, format="%d/%m/%Y")

#Plot 1 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, main = "Global Active Power", xlab = "Global Activer Power (kilowatts)", col = "red")
dev.off()