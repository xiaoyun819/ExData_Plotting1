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

png("plot2.png", width=480, height=480)

plot(data$Time, data$Global_active_power, 
     type = "l",
     main = "Global Active Power",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()