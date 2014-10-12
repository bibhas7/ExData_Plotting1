plot4 <- function(file="exdata-data-household_power_consumption/household_power_consumption.txt"){
  data<-read.table(file, header=TRUE, sep=";", colClasses="character")
  dateData1<-data[data$Date=="1/2/2007",]
  dateData2<-data[data$Date=="2/2/2007",]
  dateData<-rbind(dateData1,dateData2)
  gap<-as.numeric(dateData$Global_active_power)
  voltage<-as.numeric(dateData$Voltage)
  sm1<-as.numeric(dateData$Sub_metering_1)
  sm2<-as.numeric(dateData$Sub_metering_2)
  sm3<-as.numeric(dateData$Sub_metering_3)
  grp<-as.numeric(dateData$Global_reactive_power)
  dateTime<-strptime(paste(dateData$Date,dateData$Time), format="%d/%m/%Y %H:%M:%S")
  
  png(file="plot4.png",height=480, width=480,units="px")
  par(mfrow=c(2,2))
  
  plot(dateTime,gap,pch=".",xlab="",ylab="Global Active Power")
  lines(dateTime,gap)
  
  plot(dateTime,voltage,pch=".",xlab="datetime",ylab="Voltage")
  lines(dateTime,voltage)
  
  plot(dateTime,sm1,pch=".",xlab="",ylab="Energy sub metering")
  lines(dateTime,sm1)
  lines(dateTime,sm2,pch=".",col="red")
  lines(dateTime,sm3,pch=".",col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch=20,col=c("black","red","blue"))
  
  plot(dateTime,grp,pch=".",xlab="datetime",ylab="Global_reactive_power")
  lines(dateTime,grp)
  
  dev.off()
}