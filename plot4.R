data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") # Read data
Dates <- as.Date(data$Date, format = "%d/%m/%Y") # Convert Date variable to date format
select.dates <- Dates == as.Date("01/02/2007", format = "%d/%m/%Y") | Dates == as.Date("02/02/2007", format = "%d/%m/%Y")
mydata <- data[select.dates,] # Subset relevant dates from data set 
time <- mydata$Time
Gtime <- paste(mydata$Date, time, sep = ";")  # Paste date and time to create character vector
datetime <- strptime(Gtime, "%d/%m/%Y;%H:%M:%S") # Convert to POSITlx

png(file = "plot4.png", width = 480, height = 480) # Create png file
par(mfrow = c(2,2), mar = c(5, 5, 3, 1)) # Set plot parameters
plot(datetime, mydata$Global_active_power, xlab = "", ylab = "Global Active Power", main = "", type = "l") # Plot 1 call
plot(datetime, mydata$Voltage, xlab = "datetime", ylab = "Voltage", main = "", type = "l") # Plot 2 call
plot(datetime, mydata$Sub_metering_1, xlab = "", ylab = "Energy sub metering", main = "", type = "l") ## Plot 3 call
lines(datetime, mydata$Sub_metering_2, col = "red") # Label plot 3
lines(datetime, mydata$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), seg.len = 2, lty = 1, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(datetime, mydata$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", main = "", type = "l") # Plot 4
dev.off() # Close device
