setwd("./Documents/coursera/eda")

df <- read.table("household_power_consumption.txt", 
                 sep = ";",
                 header = TRUE, 
                 na = "?",
                 colClasses=c("character", "character", rep("numeric",7)))

df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")

dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(df, Date %in% dates)

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2))

plot(data$Time, data$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

plot(data$Time, data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(data$Time, data$Sub_metering_1, type = "l", col = "black", 
     xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, type = "l", col = "red")
lines(data$Time, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", 
       lty = 1,
       bty = "n",
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$Time, data$Global_reactive_power, 
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()

