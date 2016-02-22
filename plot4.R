df <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
# Convert from character to date
df$Date <- as.Date(df$Date, "%d/%m/%Y")
# Get relevant dates
df_subset <- subset(df, Date > "2007-01-31" & Date < "2007-02-03")
# Convert from character to numeric
df_subset$Global_active_power <- as.numeric(df_subset$Global_active_power)
# Combine date and time into a single column
df_subset$DT <- paste(df_subset$Date, df_subset$Time, sep=":")
# Convert character to date/time
df_subset$DT <- strptime(df_subset$DT,format = '%Y-%m-%d:%H:%M:%S')

library(datasets)

# Plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
# 1st
plot(df_subset$DT, df_subset$Global_active_power/1000, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
# 2nd
plot(df_subset$DT, df_subset$Voltage, type="l", xlab = "date/time", ylab = "Voltage")
# 3rd
plot(df_subset$DT, df_subset$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering", ylim=c(-1,40))
lines(df_subset$DT, df_subset$Sub_metering_2, type = "l", col = "red")
lines(df_subset$DT, df_subset$Sub_metering_3, type = "l", col = "blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), cex = 0.75)
# 4th
plot(df_subset$DT, df_subset$Global_reactive_power, type="l", xlab = "date/time", ylab = "Global_reactive_power")

dev.off()