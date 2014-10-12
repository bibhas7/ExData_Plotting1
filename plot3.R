plot3 <- function(file="exdata-data-household_power_consumption/household_power_consumption.txt"){
  data<-read.table(file, header=TRUE, sep=";", colClasses="character")
  dateData1<-data[data$Date=="1/2/2007",]
  dateData2<-data[data$Date=="2/2/2007",]
  dateData<-rbind(dateData1,dateData2)
  sm1<-as.numeric(dateData$Sub_metering_1)
  sm2<-as.numeric(dateData$Sub_metering_2)
  sm3<-as.numeric(dateData$Sub_metering_3)
  dateTime<-strptime(paste(dateData$Date,dateData$Time), format="%d/%m/%Y %H:%M:%S")
  png(file="plot3.png",height=480, width=480,units="px")
  plot(dateTime,sm1,pch=".",xlab="",ylab="Energy sub metering")
  lines(dateTime,sm1)
  lines(dateTime,sm2,pch=".",col="red")
  lines(dateTime,sm3,pch=".",col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2,2,2),col=c("black","red","blue"))
  dev.off()
}