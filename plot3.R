## this program creates the third plot
## assume the working directory contains the downloaded file
## we use sql to read in only the dates we need
library("sqldf")
hpcdata <- read.csv.sql("household_power_consumption.txt",sep = ";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007" ')

## create a date/time column
hpcdata$DateTime <- strptime(paste(hpcdata$Date,hpcdata$Time), "%d/%m/%Y %H:%M:%S")

#make the plot - plot each sub_metering separately
plot(hpcdata$DateTime,hpcdata$Sub_metering_1,type="l",ylab = "Energy sub metering")
lines(hpcdata$DateTime,hpcdata$Sub_metering_2,col = "red")
lines(hpcdata$DateTime,hpcdata$Sub_metering_3,col = "blue")
#add a legend
legend("topright",cex = .7,lty = 1,col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## save plot
dev.copy(png,file="plot3.png")
dev.off()