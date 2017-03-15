setwd("C:/Users/Rohan Shingade/Downloads")
data <- read.table("household_power_consumption.txt",header=T,sep=";",
                   na.strings="?",stringsAsFactors = F)
data_sub <- rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])
data_sub$Date <- as.Date(data_sub$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)
png("plot2.png",width=480,height=480)
plot(y=data_sub$Global_active_power, x=data_sub$Datetime,type="l",
     xlab= "",ylab="Global Active power (kilowatts)")
dev.off()