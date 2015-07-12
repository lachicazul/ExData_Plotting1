##install.packages("sqldf")
##library(sqldf)
##Dowload the txt from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##Loading data
ElectricData <- read.csv.sql(file = "household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",header = T, sep=";")

##New Weekday and DateTime cols
##library(lubridate)
ElectricData$WeekDay = weekdays(ElectricData$Date)
ElectricData$DateTime <- dmy_hms(paste(ElectricData$Date,ElectricData$Time)) 

##Plot 1
##library(datasets)
## Create plot on screen device
with(ElectricData, hist(ElectricData$Global_active_power ,main = "Global Active Power", col = "Red", xlab = "Global Active Power (kilowatts)")) 
## Copy my plot to a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px") 
##Close the device
dev.off() 



