library(lubridate)
#Reading the Data in

power <- read.csv("power.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

## Subsetting the data
subpower <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
#days_subpower<-wday(subpower$Date)

## Converting dates
datetime <- paste(as.Date(subpower$Date), subpower$Time)
subpower$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(subpower$Global_active_power~subpower$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()