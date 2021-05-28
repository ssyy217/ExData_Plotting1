# download and unzip data
if(!file.exists("data")) dir.create("data")
FileURL <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'  
download.file(FileURL, destfile="C:/Users/ssyy2/Downloads/R/Course 4/data/household_power_consumption.zip")
unzip("C:/Users/ssyy2/Downloads/R/Course 4/data/household_power_consumption.zip", exdir="C:/Users/ssyy2/Downloads/R/Course 4/data")

# read data into R
files <- file("C:/Users/ssyy2/Downloads/R/Course 4/data/household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')
head(data)

# Plot 4
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# open device
png(filename="plot4.png", width=480, height=480, units="px")

par(mfrow=c(2,2))
plot(data$DateTime, data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(data$DateTime, data$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot (data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red"," blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1)
plot(data$DateTime, data$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")

# close device
dev.off()
