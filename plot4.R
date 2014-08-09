## this program creates the 4th plot
## assume the working directory contains the downloaded file
## we use sql to read in only the dates we need
library("sqldf")
hpcdata <- read.csv.sql("household_power_consumption.txt",sep = ";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007" ')

## create a date/time column
hpcdata$DateTime <- strptime(paste(hpcdata$Date,hpcdata$Time), "%d/%m/%Y %H:%M:%S")

## create the plot
par(mfrow=c(2,2),mar=c(2.2,4,1,1))
## upper left
with(hpcdata,plot(DateTime,Global_active_power,type="l",ylab = "Global Active Power"))
## upper right
with(hpcdata,plot(DateTime,Voltage,type="l"))
## lower left
plot(hpcdata$DateTime,hpcdata$Sub_metering_1,type="l",ylab = "Energy sub metering")
lines(hpcdata$DateTime,hpcdata$Sub_metering_2,col = "red")
lines(hpcdata$DateTime,hpcdata$Sub_metering_3,col = "blue")
legend("topright",cex = .4,lty = 1,col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## lower right
with(hpcdata,plot(DateTime,Global_reactive_power,type = "l"))
## save plot
dev.copy(png,file="plot4.png")
dev.off()