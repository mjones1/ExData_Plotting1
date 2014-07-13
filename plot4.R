# read in data into temporary data.frame
tmp<-read.csv("household_power_consumption.txt", header=TRUE,sep=";", na.strings="?")

# subset tmp data.frame for data for February 1 & 2, 2007
power_con<-tmp[grep("^[1-2]/2/2007",tmp$Date),]

# coerce Date and Time variable into POSIXlt class
power_con$Time <- strptime(paste(power_con$Date, power_con$Time), "%d/%m/%Y %H:%M:%S")

#Create Plot #4
# open PNG graphics device
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
# setup up 2x2 matrix on graphics device for the 4 graphs
par(mfrow=c(2,2))

# plot first subplot
plot(power_con$Time, power_con$Global_active_power,type="n", xlab="",ylab="Global Active Power")
lines(power_con$Time,power_con$Global_active_power)

# plot second subplot
plot(power_con$Time, power_con$Voltage,type="n", xlab="datetime",ylab="Voltage")
lines(power_con$Time,power_con$Voltage)

# plot third subplot
plot(power_con$Time, power_con$Sub_metering_1,type="n", xlab="",ylab="Energy sub metering")
lines(power_con$Time,power_con$Sub_metering_1)
lines(power_con$Time,power_con$Sub_metering_2, col="red")
lines(power_con$Time,power_con$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1:1,bty="n")

# plot fourth subplot
plot(power_con$Time, power_con$Global_reactive_power,type="n", xlab="datetime",ylab="Global_reactive_power")
lines(power_con$Time,power_con$Global_reactive_power)
#close graphics device
dev.off()
