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

## Plot 1
hist(householdPowerFebruary$Global_active_power, 
     main = "Global Active Power", 
     col = "Red", 
     xlab = "Global Active Power (kilowatts)")