library(lubridate)
#Reading the Data 

power <- read.csv("power.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

## Subsetting data
subpower <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
subMetering1 <- as.numeric(power$Sub_metering_1)
subMetering2 <- as.numeric(power$Sub_metering_2)
subMetering3 <- as.numeric(power$Sub_metering_3)
#days_subpower<-wday(subpower$Date)

## Converting dates
datetime <- paste(as.Date(subpower$Date), subpower$Time)
subpower$Datetime <- as.POSIXct(datetime)

## Plot 3
dev.copy(png, file="plot3.png", height=480, width=480)
plot(subpower$Datetime, subMetering1, type="l", col="black", ylab="Eneregy Sub Metering", xlab="",
     lines(subpower$Datetime, subMetering2, type="l", col="red"),
     lines(subpower$Datetime, subMetering3, type="l", col="blue"))
legend("topleft", legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red", "blue"))

dev.off()





png("plot3.png", width=480, height=480)
plot(subpower$Datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(subpower$Datetime, subMetering2, type="l", col="red")
lines(subpower$Datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()