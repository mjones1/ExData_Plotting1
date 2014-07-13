# read in data into temporary data.frame
tmp<-read.csv("household_power_consumption.txt", header=TRUE,sep=";", na.strings="?")

# subset tmp data.frame for data for February 1 & 2, 2007
power_con<-tmp[grep("^[1-2]/2/2007",tmp$Date),]

# coerce Date and Time variable into POSIXlt class
power_con$Time <- strptime(paste(power_con$Date, power_con$Time), "%d/%m/%Y %H:%M:%S")


# Create Plot #1
# open PNG graphics device
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
# create histogram of Global_active_power
hist(power_con$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
#close graphics dev
dev.off()
