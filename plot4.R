plot4 <- function() {

#power<-read.table("household_power_consumption.csv",sep=";",head=TRUE)
jpeg('plot4.jpg')
par(mfrow = c(2,2))

date_power<-power[which(power$Date=="1/2/2007" | power$Date=="2/2/2007"),]

	# plot 1

global_power<-date_power$Global_active_power
global_power<-as.vector(global_power)
remove <- c("?")
clean_power<-global_power [! global_power %in% remove]
Clean_power<-as.numeric(clean_power)


plot(Clean_power,type="l",xaxt="n",xlab="",ylab="Global Active Power")
ticks<-c("Thu","Fri","Sat")
axis(1,at=day_ticks,labels=ticks)

	# plot 2

voltage <- date_power$Voltage
voltage <- as.vector(voltage)
clean_voltage<-as.numeric(voltage [! voltage %in% remove])

time_power<-date_power$Time
time_power<-as.vector(time_power)
day_ticks<-which(time_power=="00:00:00")
day_ticks<-c(day_ticks,length(time_power))

plot(clean_voltage,xaxt="n",type="l",xlab="datetime",ylab="Voltage")
ticks<-c("Thu","Fri","Sat")
axis(1,at=day_ticks,labels=ticks)

	# plot 3

meter1<-as.vector(date_power$Sub_metering_1)
meter2<-as.vector(date_power$Sub_metering_2)
meter3<-as.vector(date_power$Sub_metering_3)

clean_meter1<-as.numeric(meter1 [! meter1 %in% remove])
clean_meter2<-as.numeric(meter2 [! meter2 %in% remove])
clean_meter3<-as.numeric(meter3 [! meter3 %in% remove])

plot(clean_meter1,xaxt="n",type="n",xlab="",ylab="Energy sub metering")
ticks<-c("Thu","Fri","Sat")
axis(1,at=day_ticks,labels=ticks)
points(clean_meter1,col = "black",type="s")
points(clean_meter2,col = "red",type="s")
points(clean_meter3,col = "blue",type="s")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1))

	# plot 4

global_repower<-date_power$Global_reactive_power
global_repower<-as.vector(global_repower)
remove <- c("?")
clean_repower<-global_repower [! global_repower %in% remove]
Clean_repower<-as.numeric(clean_repower)
plot(Clean_repower,type="s",xaxt="n",xlab="datetime",ylab="Global_rective_power")
ticks<-c("Thu","Fri","Sat")
axis(1,at=day_ticks,labels=ticks)

dev.off()
}