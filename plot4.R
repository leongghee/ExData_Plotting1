library(data.table)
powerData<-read.table("household_power_consumption.txt",
                      header=TRUE,
                      sep=";",
                      na.strings="?")

powerData$Date<-as.Date(powerData$Date,"%d/%m/%Y")
powerData<- subset(powerData,Date>= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

dateTime<-paste(powerData$Date,powerData$Time)
finalData<-cbind(dateTime,powerData)
finalData$dateTime<-as.POSIXct(dateTime)

par(mfrow=c(2,2))

#graph1
plot(finalData$dateTime,finalData$Global_active_power,type="l", xlab = "", ylab = "Global Active Power")

#graph2
plot(finalData$dateTime,finalData$Voltage,type="l", xlab = "datetime", ylab = "Voltage")

#graph3
plot(finalData$dateTime,finalData$Sub_metering_1,type="l", xlab = "", ylab="Energy sub metering")
lines(finalData$dateTime,finalData$Sub_metering_2,col='Red')
lines(finalData$dateTime,finalData$Sub_metering_3,col='Blue')
labels <-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
colorlines <- c("black","red","blue")
legend("topright",bty="n",legend=labels,col=colorlines,lty="solid")

#graph4
plot(finalData$dateTime,finalData$Global_reactive_power,type="l",xlab = "datetime", ylab = "Global_reactive_power (kilowatts)")

dev.copy(png,"plot4.png",width = 480, height = 480)
dev.off()