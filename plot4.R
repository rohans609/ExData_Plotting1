setwd("C:/Users/Rohan Shingade/Downloads")
data <- read.table("household_power_consumption.txt",header=T,sep=";",
                   na.strings="?",stringsAsFactors = F)
data_sub <- rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])
data_sub$Date <- as.Date(data_sub$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1))
plot(data_sub$Global_active_power ~ data_sub$Datetime, type="l", xlab= "", ylab="Global Active Power")

plot(data_sub$Voltage ~ data_sub$Datetime, type="l", xlab= "datetime", ylab="Voltage")

plot(data_sub$Sub_metering_1 ~ data_sub$Datetime, type="l", xlab= "", ylab="Energy Sub Metering")
lines(data_sub$Sub_metering_2 ~ data_sub$Datetime, col = 'Red')
lines(data_sub$Sub_metering_3 ~ data_sub$Datetime, col = 'Blue')
legend("topright", lty=1, lwd =2, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(data_sub$Global_reactive_power ~ data_sub$Datetime, type="l", xlab= "datetime", ylab="Global_reactive_power")
dev.off()