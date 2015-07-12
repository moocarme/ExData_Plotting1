## R file that reads and creates png file for plot 1


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

## Plot 1
## open png file
png(filename = "plot1.png", width = 480, height = 480, units = "px")
## plot data
hist(myData$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
## close png
dev.off()
