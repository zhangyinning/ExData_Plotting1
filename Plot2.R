# Read the data.
power_consumption <- read.table("Documents/household_power_consumption.txt", sep = ";", header = TRUE)

# subset the data.
sub <- subset(power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

# Convert the data type of the Active_Power column to Numeric.
sub$Global_active_power <- as.numeric(as.character(sub$Global_active_power))

# Create a new column by adding the date and time.
sub$DateTime <- strptime(paste(sub$Date, sub$Time), format="%d/%m/%Y %H:%M:%S")

# Generate the plot.
with(sub, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

# Print out to a .png file.
dev.print(png, file = "plot2.png", width = 480, height = 480)
dev.off()
