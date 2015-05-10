library(lubridate)
#Reading the Data in
power <-read.csv("power.txt", header=T, sep=';', na.strings="?", 
         nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
##powr$Date <- as.Date(powr$Date, "mm/dd/YYYY")

## Subsetting the required date range
subpower <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]
days_subpower<-wday(subpower$Date)

## Converting to Global Active power to numeric datatype
gap <- as.numeric(subpower$Global_active_power)

# plotting the histogram
png("plot1.png", width=480, height=480)
hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()