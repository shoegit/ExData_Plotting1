library(sqldf)
fn<-"household_power_consumption.txt"
power<-read.csv.sql(fn, sql = 'select * from file where Date="1/2/2007" OR Date="2/2/2007"', sep=';')



#read dates
dates <-power$Date
times <-power$Time
datetime<-paste(dates, times)
datetime<-strptime(datetime, "%d/%m/%Y %H:%M:%S")

# add new column to the power data
pwrData<-cbind(datetime, power)

#Plot the activity of global active power over the two days by time
# save the plot to plot3.png
png('plot4.png')

# prepare to plot 2 x 2 graphs
par(mfrow=c(2,2))			

#first one: plot time against global active power
plot(pwrData$datetime, pwrData$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#second: plot time against Voltage
plot(pwrData$datetime, pwrData$Voltage, type="l", xlab="", ylab="Voltage")

#Third: Compare sub meterings
plot(pwrData$datetime, pwrData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(pwrData$datetime, pwrData$Sub_metering_2, type="l", col="red")
lines(pwrData$datetime, pwrData$Sub_metering_3, type="l", col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1),col=c("black", "red", "blue")) 

#Fourth: plot time against global reactive power
plot(pwrData$datetime, pwrData$Global_reactive_power, type="l",xlab="", ylab="Global reactive power")
dev.off()
