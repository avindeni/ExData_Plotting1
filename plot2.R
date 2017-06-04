plot2 <- function() {

#power<-read.table("household_power_consumption.csv",sep=";",head=TRUE)

date_power<-power[which(power$Date=="1/2/2007" | power$Date=="2/2/2007"),]
global_power<-date_power$Global_active_power
global_power<-as.vector(global_power)
remove <- c("?")
clean_power<-global_power [! global_power %in% remove]
Clean_power<-as.numeric(clean_power)

time_power<-date_power$Time
time_power<-as.vector(time_power)
day_ticks<-which(time_power=="00:00:00")
day_ticks<-c(day_ticks,length(time_power))

jpeg('plot2.jpg')
plot(Clean_power,type="l",xaxt="n",xlab="",ylab="Global Active Power (kilowatts)")
ticks<-c("Thu","Fri","Sat")
axis(1,at=day_ticks,labels=ticks)
dev.off()

}