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

## Plot 2
with(householdPowerFebruary, plot(Time, Global_active_power, 
                                  type = "l", 
                                  ylab = "Global Active Power (kilowatts)"))
