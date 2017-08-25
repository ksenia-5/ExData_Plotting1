data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") # Read data
Dates <- as.Date(data$Date, format = "%d/%m/%Y") # Convert Date variable to date format
select.dates <- Dates == as.Date("01/02/2007", format = "%d/%m/%Y") | Dates == as.Date("02/02/2007", format = "%d/%m/%Y")
mydata <- data[select.dates,] # Subset relevant dates from data set 
png(file = "plot1.png", width = 480, height = 480) # Create png file
par(mar = c(5, 5, 4, 3)) # Set plot parameters
hist(mydata$Global_active_power, col = "red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power") # Call plot
dev.off() # Close device

