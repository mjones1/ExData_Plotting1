# read in data into temporary data.frame
tmp<-read.csv("household_power_consumption.txt", header=TRUE,sep=";", na.strings="?")

# subset tmp data.frame for data for February 1 & 2, 2007
power_con<-tmp[grep("^[1-2]/2/2007",tmp$Date),]

# coerce Date and Time variable into POSIXlt class
power_con$Time <- strptime(paste(power_con$Date, power_con$Time), "%d/%m/%Y %H:%M:%S")

#Create Plot #2
# open PNG graphics device
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
# create blank graph frame so we can add the line graph in next step
plot(power_con$Time, power_con$Global_active_power,type="n", xlab="",ylab="Global Active Power (kilowatts)")
# add lines to the plot
lines(power_con$Time,power_con$Global_active_power)
#close graphics device
dev.off()

