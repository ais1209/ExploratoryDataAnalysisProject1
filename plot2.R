data <- read.table("./data/household_power_consumption.txt",sep=';',header=TRUE,na.strings = c("?",""));

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
temp <- paste(data$Date, data$Time)  
data$Time <- strptime(temp, format = "%Y-%m-%d %H:%M:%S") 

# Select subset
d <- subset.data.frame(data,(data$Date >= as.Date("2007-02-01") & data$Date <=as.Date("2007-02-02")))

# Plot to PNG file
png(file='plot2.png',width = 480, height = 480, units = "px")
with(d,plot(d$Time,d$Global_active_power,type = 'l',xlab = " ",ylab = "Global Active Power (kilowatts)"))
dev.off()