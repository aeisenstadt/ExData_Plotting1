## Read data

householdPower <- read.table("household_power_consumption.txt", 
                             header = TRUE, 
                             sep = ";")
householdPowerFebruary <- householdPower[householdPower$Date == "1/2/2007" | 
                                                 householdPower$Date == "2/2/2007",]


householdPowerFebruary$Time <- strptime(paste(householdPowerFebruary$Date,"/",
                                              householdPowerFebruary$Time),
                                        "%d/%m/%Y / %H:%M:%S")
householdPowerFebruary$Date <- as.Date(householdPowerFebruary$Date, "%d/%m/%Y")
householdPowerFebruary[,3:8] <- lapply(householdPowerFebruary[,3:8], 
                                       function(x) as.numeric(as.character(x)))

## Plot 3
with(householdPowerFebruary, plot(Time, Sub_metering_1, 
                                  type = "l", 
                                  ylab = "Energy sub metering"))

lines(householdPowerFebruary$Time, householdPowerFebruary$Sub_metering_2, 
      col = "red")
lines(householdPowerFebruary$Time, householdPowerFebruary$Sub_metering_3, 
      col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty= 1:1)
