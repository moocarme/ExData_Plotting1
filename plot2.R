## R file that reads and creates png file for plot 2


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

## Plot 2
## open png file
png(filename = "plot2.png", width = 480, height = 480, units = "px")
## plot data
plot(myData$Global_active_power,type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)", xaxt= "n")
## create tick marks
axis(side = 1, at = c(1,nrow(myData)/2,nrow(myData)), 
     labels = c("Thu", "Fri", "Sat"))
## close png file
dev.off()
