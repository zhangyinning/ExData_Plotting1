# Read the data.
power_consumption <- read.table("Documents/household_power_consumption.txt", sep = ";", header = TRUE)

# subset the data.
sub <- subset(power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

# Convert the data type of the Active_Power column to Numeric.
sub$Global_active_power <- as.numeric(as.character(sub$Global_active_power))

# Create a new column by adding the date and time.
sub$DateTime <- strptime(paste(sub$Date, sub$Time), format="%d/%m/%Y %H:%M:%S")

# Generate the plot and add the lines
with(sub, plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black"))

# Add the data of the other two columns to the plot
lines(sub$DateTime, sub$Sub_metering_2, col = "red")
lines(sub$DateTime, sub$Sub_metering_3, col = "blue")

# Add the legend.
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

# Print out to a .png file.
dev.print(png, file = "plot3.png", width = 480, height = 480)
dev.off()
