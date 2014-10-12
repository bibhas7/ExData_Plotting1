plot2 <- function(file="exdata-data-household_power_consumption/household_power_consumption.txt"){
  data<-read.table(file, header=TRUE, sep=";", colClasses="character")
  dateData1<-data[data$Date=="1/2/2007",]
  dateData2<-data[data$Date=="2/2/2007",]
  dateData<-rbind(dateData1,dateData2)
  x<-as.numeric(dateData$Global_active_power)
  dateTime<-strptime(paste(dateData$Date,dateData$Time), format="%d/%m/%Y %H:%M:%S")
  png(file="plot2.png",height=480, width=480,units="px")
  plot(dateTime,x,pch=".",xlab="",ylab="Global Active Power (kilowatts)")
  lines(dateTime,x)
  dev.off()
}