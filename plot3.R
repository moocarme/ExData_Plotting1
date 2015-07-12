## R file that reads and creates png file for plot 3


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

## Plot 3
## open png file
png(filename = "plot3.png", width = 480, height = 480, units = "px")

## plot data
plot(myData$Sub_metering_1,col = "black",type = "l", xlab = "", 
     ylab = "Energy Sub Metering", xaxt= "n")
points(myData$Sub_metering_2,col = "red",type = "l", xlab = "", xaxt= "n")
points(myData$Sub_metering_3,col = "blue",type = "l", xlab = "", xaxt= "n")
## create legend
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty =1, col = c("black", "red","blue"))
## create tick marks
axis(side = 1, at = c(1,nrow(myData)/2,nrow(myData)), 
     labels = c("Thu", "Fri", "Sat"))

## close png
dev.off()
