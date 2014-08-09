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

png("plot3.png", width=480, height=480)

with(data, plot(data$Time, data$Sub_metering_1, type = "l", col = "black", 
                xlab = "", ylab = "Energy sub metering"))
with(data, lines(data$Time, data$Sub_metering_2, type = "l", col = "red")) 
with(data, lines(data$Time, data$Sub_metering_3, type = "l", col = "blue"))

legend("topright", 
       lty = 1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()