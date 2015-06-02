library(sqldf)
fn<-"household_power_consumption.txt"
power<-read.csv.sql(fn, sql = 'select * from file where Date="1/2/2007" OR Date="2/2/2007"', sep=';')

