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
# save the plot to plot2.png
png('plot3.png')
plot(pwrData$datetime, pwrData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(pwrData$datetime, pwrData$Sub_metering_2, col="red")
lines(pwrData$datetime, pwrData$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1),col=c("black", "red", "blue")) 
dev.off()
