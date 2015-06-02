
# read required data using sqldf package
library(sqldf)
fn<-"household_power_consumption.txt"
power<-read.csv.sql(fn, sql = 'select * from file where Date="1/2/2007" OR Date="2/2/2007"', sep=';')

# save the plot to plot1.png
png('plot1.png')
hist(power$Global_active_power, col="red", xlab="Global Active Power (Kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()