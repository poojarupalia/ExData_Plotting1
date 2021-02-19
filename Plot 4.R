##Load data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
#We will only be using data from the dates 2007-02-01 and 2007-02-02
subSetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
subSetData$Date <- as.Date(subSetData$Date, format="%d/%m/%Y")

#Plot 4
globalActivePower <- as.numeric(subSetData$Global_active_power)
datetime <- paste(as.Date(subSetData$Date), subSetData$Time)
subSetData$Datetime <- as.POSIXct(datetime)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))


with(subSetData, {
  ##Plot 1
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power", xlab="")
  ##Plot 2
  plot(Voltage~Datetime, type="l",
       ylab="Voltage", xlab="datetime")
  ##Plot 3
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  ##Plot4
  plot(Global_reactive_power~Datetime, type="l",
       ylab="Global_reactive_power", xlab="datetime")
})
dev.off()
