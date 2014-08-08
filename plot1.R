## this program creates the first plot
## assume the working directory contains the downloaded file
## we use sql to read in only the dates we need
library("sqldf")
hpcdata <- read.csv.sql("household_power_consumption.txt",sep = ";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007" ')
## create a date/time column
hpcdata$DateTime <- strptime(paste(hpcdata$Date,hpcdata$Time), "%d/%m/%Y %H:%M:%S")

## create plot
hist(hpcdata$Global_active_power, col = "red",main = "Global Active Power",xlab="Global Active Power (kilowatts)")

## save plot
dev.copy(png,file="plot1.png")
dev.off()