setwd("C:/Users/17244/Documents/R/CourseEra")

library(datetime)
library(lubridate)

household_data <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

data1 <- rbind(household_data[household_data$Date=="1/2/2007",],household_data[household_data$Date=="2/2/2007",])

hist(as.numeric(data1$Global_active_power), main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab ="Frequency", col ="Red" )
png("plot1.png", width = 480, height = 480)
dev.off()



data1$Date <- as.Date(data1$Date, "%d/%m/%Y")
data1 <- cbind(data1, "DateTime" = as.POSIXct( paste(as.Date(data1$Date), data1$Time)))

plot(data1$Global_active_power ~ data1$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()


with(data1, {plot(Sub_metering_1 ~ DateTime, type = "l", xlab="", ylab = "Energy sub metering")})

lines(data1$Sub_metering_2 ~ data1$DateTime, col = "Red")
lines(data1$Sub_metering_3 ~ data1$DateTime,, col = "Blue")

legend("topright", lty = 1, lwd = 3, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()

par(mfrow = c(2,2))
plot(data1$Global_active_power ~ data1$DateTime, type = "l", xlab="", ylab = "Global Active Power")
plot(data1$Voltage ~ data1$DateTime, type = "l", xlab="datetime", ylab = "Voltage")
 

       
with(data1, {plot(Sub_metering_1 ~ DateTime, type = "l", xlab="DateTime", ylab = "Energy sub metering")})
lines(data1$Sub_metering_2 ~ data1$DateTime, col = "Red")
lines(data1$Sub_metering_3 ~ data1$DateTime,, col = "Blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))        
        
plot(data1$Global_reactive_power ~ data1$DateTime, type="l", xlab="datetime", ylab = "Global_reactive_power")        

dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()       
        
