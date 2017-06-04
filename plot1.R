plot1 <- function() {

#power<-read.table("household_power_consumption.csv",sep=";",head=TRUE)

date_power<-power[which(power$Date=="1/2/2007" | power$Date=="2/2/2007"),]

global_power<-date_power$Global_active_power
global_power<-as.vector(global_power)
remove <- c("?")
clean_power<-global_power [! global_power %in% remove]
Clean_power<-as.numeric(clean_power)

jpeg('plot1.jpg')
hist(Clean_power,col=2,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()
}