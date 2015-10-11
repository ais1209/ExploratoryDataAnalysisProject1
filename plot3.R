data <- read.table("./data/household_power_consumption.txt",sep=';',header=TRUE,na.strings = c("?",""));

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
temp <- paste(data$Date, data$Time)  
data$Time <- strptime(temp, format = "%Y-%m-%d %H:%M:%S") 

# Select subset
d <- subset.data.frame(data,(data$Date >= as.Date("2007-02-01") & data$Date <=as.Date("2007-02-02")))

# Plot to PNG file
png(file='plot3.png',width = 480, height = 480, units = "px")
with(d,plot(d$Time,d$Sub_metering_1,type = 'n',xlab = "",ylab = "Energy sub-metering"))
points(d$Time,d$Sub_metering_1,type='l')
points(d$Time,d$Sub_metering_2,type='l',col="red")
points(d$Time,d$Sub_metering_3,type='l',col="blue")
legend("topright",lty=1,col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()