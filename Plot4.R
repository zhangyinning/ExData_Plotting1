# Read the data.
power_consumption <- read.table("Documents/household_power_consumption.txt", sep = ";", header = TRUE)

# subset the data.
sub <- subset(power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

# Convert the data type of the Active_Power column to Numeric.
sub$Global_active_power <- as.numeric(as.character(sub$Global_active_power))

# Create a new column by adding the date and time.
sub$DateTime <- strptime(paste(sub$Date, sub$Time), format="%d/%m/%Y %H:%M:%S")

# Generate the 2*2 multiple base plot
par(mfrow = c(2, 2))
with(sub, {
  plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  plot(DateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
  lines(sub$DateTime, sub$Sub_metering_2, col = "red")
  lines(sub$DateTime, sub$Sub_metering_3, col = "blue")
  plot(DateTime, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
})

# Print out to a .png file.
dev.print(png, file = "plot4.png", width = 480, height = 480)
dev.off()
