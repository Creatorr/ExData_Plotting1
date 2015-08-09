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


#plot3
png(file = "plot3.png", width = 480, height = 480)
Sys.setlocale("LC_ALL", "English")
plot(elpow$DateTime, elpow$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     main = "",
     col = "black")
lines(elpow$DateTime, elpow$Sub_metering_2, col = "red")
lines(elpow$DateTime, elpow$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

## Restore Locale
## Sys.setlocale("LC_ALL", "Russian")
