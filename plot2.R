data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") # Read data
Dates <- as.Date(data$Date, format = "%d/%m/%Y") # Convert Date variable to date format
select.dates <- Dates == as.Date("01/02/2007", format = "%d/%m/%Y") | Dates == as.Date("02/02/2007", format = "%d/%m/%Y")
mydata <- data[select.dates,] # Subset relevant dates from data set 
time <- mydata$Time
Gtime <- paste(mydata$Date, time, sep = ";")  # Paste date and time to create character vector
datetime <- strptime(Gtime, "%d/%m/%Y;%H:%M:%S") # Convert to POSITlx
png(file = "plot2.png", width = 480, height = 480) # Create png file
par(mar = c(5, 5, 4, 3)) # Set plot parameters
plot(datetime, mydata$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", main = "", type = "l") # Call plot
dev.off() # Close device
