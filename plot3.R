# read in data into temporary data.frame
tmp<-read.csv("household_power_consumption.txt", header=TRUE,sep=";", na.strings="?")

# subset tmp data.frame for data for February 1 & 2, 2007
power_con<-tmp[grep("^[1-2]/2/2007",tmp$Date),]

# coerce Date and Time variable into POSIXlt class
power_con$Time <- strptime(paste(power_con$Date, power_con$Time), "%d/%m/%Y %H:%M:%S")

#Create Plot #3
# open PNG graphics device
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
# create blank graph frame so we can add the line graph in next step
plot(power_con$Time, power_con$Sub_metering_1,type="n", xlab="",ylab="Energy sub metering")
# add lines for each of the 3 sub metering variables
lines(power_con$Time,power_con$Sub_metering_1)
lines(power_con$Time,power_con$Sub_metering_2, col="red")
lines(power_con$Time,power_con$Sub_metering_3, col="blue")
# add legend in the topright of the plot
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1:1)
# close graphics device
dev.off()

