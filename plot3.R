## Exploratory Data Analysis - Peer Assessments / Course Project 1
## plot3.R

###  Set the working directory and set file name

setwd( "C:/Coursera")
fileName <- "household_power_consumption.txt"

### Read the file

data <- read.csv( fileName, header = TRUE, sep = ";",
                  stringsAsFactors = FALSE, na.strings = "?" )

###Convert and format the data$Date and data$Time to Class Date
### and stores in a new column DateTime

data$DateTime <- strptime( paste( data$Date, data$Time ),
                           "%d/%m/%Y %H:%M:%S", tz="UTC" )

### Separate the interval  of interest

begin = strptime( "01/02/2007 00:00:00",
                  format = "%d/%m/%Y %H:%M:%S", tz = "UTC" ) 

end = strptime( "02/02/2007 23:59:59",
                format = "%d/%m/%Y %H:%M:%S", tz = "UTC" ) 

### Subset the data

data = data[ data$DateTime >= begin & data$DateTime <= end, ] 

### Create PNG image

png( filename = "plot3.png", width = 480, height = 480 )

### Generate the plot

plot( data$DateTime, data$Sub_metering_1, xlab = "",
      ylab = "Energy sub metering", type = "l" )

lines( data$DateTime, data$Sub_metering_2, xlab = "",
       type = "l", col = "Red" )

lines( data$DateTime, data$Sub_metering_3, xlab = "",
       type = "l", col = "Blue" )

legend( "topright", col =c ("Black", "Red", "Blue") , lty = 1, lwd = 2,
        legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ) )

### Close grDevice

dev.off() 
