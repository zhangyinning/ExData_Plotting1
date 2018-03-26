# Read the data.
power_consumption <- read.table("Documents/household_power_consumption.txt", sep = ";", header = TRUE)

# subset the data.
sub <- subset(power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

# Convert the data type of the Active_Power column to Numeric.
sub$Global_active_power <- as.numeric(as.character(sub$Global_active_power))

# Generate a histogram.
hist(sub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Print the chart to a .png file.
dev.print(png, file = "plot1.png", width = 480, height = 480)
dev.off()