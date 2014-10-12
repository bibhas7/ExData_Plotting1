plot1 <- function(file="exdata-data-household_power_consumption/household_power_consumption.txt"){
  data<-read.table(file, header=TRUE, sep=";", colClasses="character")
  dateData1<-data[data$Date=="1/2/2007",]
  dateData2<-data[data$Date=="2/2/2007",]
  dateData<-rbind(dateData1,dateData2)
  x<-as.numeric(dateData$Global_active_power)
  png(file="plot1.png",height=480, width=480,units="px")
  hist(x,main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
  dev.off()
}