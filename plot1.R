data <- read.table("./data/household_power_consumption.txt",sep=';',header=TRUE,na.strings = c("?",""));
#head(data,5)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
temp <- paste(data$Date, data$Time)  
data$Time <- strptime(temp, format = "%Y-%m-%d %H:%M:%S") 

# Select subset
d <- subset.data.frame(data,(data$Date >= as.Date("2007-02-01") & data$Date <=as.Date("2007-02-02")))

# Plot to PNG file
png(file='plot1.png',height=480, width = 480, units = "px")
hist(d$Global_active_power,col='red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()