setwd("C:/Users/Rohan Shingade/Downloads")
data <- read.table("household_power_consumption.txt",header=T,sep=";",
                   na.strings="?",stringsAsFactors = F)
data_sub <- rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])
data_sub$Date <- as.Date(data_sub$Date, format="%d/%m/%Y")
png("plot1.png",width=480,height=480)
hist(data_sub$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()