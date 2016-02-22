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

# Plot 3
png("plot3.png", width=480, height=480)
plot(df_subset$DT, df_subset$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering", ylim=c(-1,40))
lines(df_subset$DT, df_subset$Sub_metering_2, type = "l", col = "red")
lines(df_subset$DT, df_subset$Sub_metering_3, type = "l", col = "blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()