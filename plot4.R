## Download and unzip file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = ".\\data\\household_power_consumption.zip")
unzip(".\\data\\household_power_consumption.zip", exdir = ".\\data")

## load subset 01.02.07 - 02.02.07 and convert DateTime
colNames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
elpow <- read.table(".\\data\\household_power_consumption.txt",
                    sep = ";",
                    col.names = colNames,
                    skip = 66637, nrows = 2880,
                    na.strings = "?")
elpow <- cbind(elpow, DateTimeConvert = strptime(paste(elpow$Date, elpow$Time), "%d/%m/%Y %H:%M:%S"))


#plot4
png(file = "plot4.png", width = 480, height = 480)
Sys.setlocale("LC_ALL", "English")
par(mfrow = c(2,2))

##upleft
plot(elpow$DateTime, elpow$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power",
     main = "")

##upright
plot(elpow$DateTime, elpow$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage",
     main = "")

##downleft
plot(elpow$DateTime, elpow$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     main = "",
     col = "black")
lines(elpow$DateTime, elpow$Sub_metering_2, col = "red")
lines(elpow$DateTime, elpow$Sub_metering_3, col = "blue")
legend("topright", 
       lwd = 1,
       bty = "n",
       cex = 0.8,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##downright
plot(elpow$DateTime, elpow$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power",
     main = "")

dev.off()

## Restore Locale
## Sys.setlocale("LC_ALL", "Russian")
