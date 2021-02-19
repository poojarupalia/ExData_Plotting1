##Load data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
#We will only be using data from the dates 2007-02-01 and 2007-02-02
subSetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
subSetData$Date <- as.Date(subSetData$Date, format="%d/%m/%Y")

#Plot 3
datetime <- paste(as.Date(subSetData$Date), subSetData$Time)
subSetData$Datetime <- as.POSIXct(datetime)
png("plot3.png", width=480, height=480)
with(subSetData, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()