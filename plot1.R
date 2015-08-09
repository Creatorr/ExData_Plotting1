## Download and unzip file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = ".\\data\\household_power_consumption.zip")
unzip(".\\data\\household_power_consumption.zip", exdir = ".\\data")

## load subset 01.02.07 - 02.02.07
colNames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
elpow <- read.table(".\\data\\household_power_consumption.txt", sep = ";", col.names = colNames, skip = 66637, nrows = 2880)

#plot1
png(file = "plot1.png", width = 480, height = 480)
hist(elpow$Global_active_power,
                col = "red",
                xlab = "Global Active Power (kilowatts)",
                main = "Global Active Power")
dev.off()
