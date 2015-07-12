## R file that reads and creates png file for plot 4


#setwd("~/Documents/Coursera Data Science/EDA")
## read data from file
PCdata <- read.table("household_power_consumption.txt", sep = ";",
                     header = TRUE,na.strings = "?")

## set date variable to date class
PCdata$Date<-as.Date(PCdata$Date,"%d/%m/%Y")
## parse data for specified dates
good1 <- PCdata$Date == as.Date("2007-02-01","%Y-%m-%d")
good2 <- PCdata$Date == as.Date("2007-02-02","%Y-%m-%d")
good3 <- good2 | good1
myData <- PCdata[good3,]


## Plot 4
## Subplot 1

png(filename = "plot4.png", width = 480, height = 480, units = "px") 
## adjust spacing and format
par(mfcol = c(2, 2), mar = c(4,4,2,2))         
## plot data
plot(myData$Global_active_power,type = "l", xlab = "", 
     ylab = "Global Active Power", xaxt= "n")
## create tick marks
axis(side = 1, at = c(1,nrow(myData)/2,nrow(myData)),
     labels = c("Thu", "Fri", "Sat"))

## plot data
plot(myData$Sub_metering_1,col = "black",type = "l", xlab = "", 
     ylab = "Energy Sub Metering", xaxt= "n")
points(myData$Sub_metering_2,col = "red",type = "l", xlab = "", xaxt= "n")
points(myData$Sub_metering_3,col = "blue",type = "l", xlab = "", xaxt= "n")
## add legend
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty =1, col = c("black", "red","blue"), bty = "n")
## create tick marks
axis(side = 1, at = c(1,nrow(myData)/2,nrow(myData)), 
     labels = c("Thu", "Fri", "Sat"))

## plot data
plot(myData$Voltage,type = "l", xlab = "datetime", 
     ylab = "Voltage", xaxt= "n")
## create tick marks
axis(side = 1, at = c(1,nrow(myData)/2,nrow(myData)), 
     labels = c("Thu", "Fri", "Sat"))

## plot data
plot(myData$Global_reactive_power,type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power", xaxt= "n")
## create tick marks
axis(side = 1, at = c(1,nrow(myData)/2,nrow(myData)), 
     labels = c("Thu", "Fri", "Sat"))

## close png
dev.off()