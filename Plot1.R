library(data.table)
library(lubridate)
library(dplyr)

power_cons <- fread(file = "./DataScience/C4W1/household_power_consumption.txt")
power_cons <- as.data.frame(power_cons)

#Creating a new variable DateTime by combinig the variables date and time
power_cons <- power_cons %>% mutate(DateTime = paste(Date, " ", Time))

#Converting the Date variable into a Date class to enable susetting by date
power_cons$Date <- dmy(power_cons$Date)

# Subsetting the required dates
power_cons2 <- subset(power_cons, Date >= "2007-02-01" & Date <= "2007-02-02")

# Converting DateTime variable into a Posixct class
power_cons2$DateTime <- dmy_hms(power_cons2$DateTime)

#Turning the numeric variables into numeric classes
power_cons2$Global_active_power <- as.numeric(power_cons2$Global_active_power)
power_cons2$Global_reactive_power <- as.numeric(power_cons2$Global_reactive_power)
power_cons2$Voltage <- as.numeric(power_cons2$Voltage)
power_cons2$Global_intensity <- as.numeric(power_cons2$Global_intensity)
power_cons2$Sub_metering_1 <- as.numeric(power_cons2$Sub_metering_1)
power_cons2$Sub_metering_2 <- as.numeric(power_cons2$Sub_metering_2)
power_cons2$Sub_metering_3 <- as.numeric(power_cons2$Sub_metering_3)

#Opening PNG Device
png(filename = "Plot1.png", width = 480, height = 480, units = "px")

par(mfrow = c(1,1), mar = c(4,5,2,3))
hist(power_cons2$Global_active_power, xlab = "Global active power (KW)",
     main = "Global Active Power", col = "red")

#Turning off PNG device
dev.off()
