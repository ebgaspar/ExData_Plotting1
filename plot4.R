## Exploratory Data Analysis - Peer Assessments / Course Project 1
## plot4.R

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

png( filename = "plot4.png", width = 480, height = 480 )

### Generate the plots by column

par( mfcol = c( 2, 2 ), mar = c( 4, 4, 2, 1 ), oma = c( 0, 0, 2, 0 ) )

#### Plot 1

plot( data$DateTime, data$Global_active_power, xlab = "",
      ylab = "Global Active Power(kilowatts)", type = "l" )

#### Plot 2

plot( data$DateTime, data$Sub_metering_1, xlab = "",
      ylab = "Energy sub metering", type = "l" )

lines( data$DateTime, data$Sub_metering_2, xlab = "", type = "l", col = "Red" )

lines( data$DateTime, data$Sub_metering_3, xlab = "", type = "l", col = "Blue" )

legend( "topright", col =c ("black", "red", "blue") , lty = 1, lwd = 2,
        legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ) )

#### Plot 3

plot( data$DateTime, data$Voltage, xlab = "Datetime", ylab = "Voltage", type = "l" )

#### Plot 4

plot( data$DateTime, data$Global_reactive_power, xlab = "Datetime",
      ylab = "Global_reactive_power", type = "l" )

### Close grDevice

dev.off() 

