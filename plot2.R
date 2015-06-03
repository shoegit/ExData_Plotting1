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
# save the plot to plot1.png
png('plot2.png')
plot(pwrData$datetime, pwrData$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
