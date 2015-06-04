## Exploratory Data Analysis - Peer Assessments / Course Project 1
## Plot1.R


###  Set the working directory and set file name

setwd( "C:/Coursera")
fileName <- "household_power_consumption.txt"

### Read the file

data <- read.csv( fileName, header = TRUE, sep = ";",
                  stringsAsFactors = FALSE, na.strings = "?" )

###Convert and format the data$Date to Class Date

data$Date <- as.Date( data$Date, "%d/%m/%Y" )

### Separate the interval  of interest

begin = as.Date("01/02/2007", format="%d/%m/%Y") 

end = as.Date("02/02/2007", format="%d/%m/%Y") 

### Subset the data

data = data[ data$Date >= begin & data$Date <= end, ] 

### Create PNG image

png( filename = "plot1.png", width = 480, height = 480 )

### Generate the plot

hist( data$Global_active_power, main = "Global Active Power",
      xlab = "Global Active Power(kilowatts)", ylab = "Frequency", col = "red" )

### Close grDevice

dev.off() 