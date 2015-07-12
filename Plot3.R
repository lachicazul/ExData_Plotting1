##install.packages("sqldf")
##library(sqldf)
##Dowload the txt from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

##Loading data
ElectricData <- read.csv.sql(file = "household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",header = T, sep=";")

##New Weekday and DateTime cols
##library(lubridate)

ElectricData$DateTime <- dmy_hms(paste(ElectricData$Date,ElectricData$Time)) 
ElectricData$WeekDay = weekdays(ElectricData$DateTime)

##Plot 3
##library(datasets)
## Create plot on screen device

plot(ElectricData$DateTime, 
     ElectricData$Sub_metering_1,
     main = "", 
     type = "l",  
     ylab = "Energy sub metering",
     xlab = "",
     col = "black")

lines(ElectricData$DateTime, ElectricData$Sub_metering_2,col = "red")
lines(ElectricData$DateTime, ElectricData$Sub_metering_3,col = "blue")

legend("topright", 
       lty = c(1,1,1), 
       col = c("black","red", "blue"), 
       legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),
       adj = 0,
       cex = 0.8,
       xjust = 0,
       text.width = 50000)

## Copy my plot to a PNG file
dev.copy(png, 
         file = "plot3.png", 
         width = 480, 
         height = 480, 
         units = "px") 

##Close the device
dev.off() 
