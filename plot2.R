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

## plot2

plot(finalData$dateTime,finalData$Global_active_power,type="l", xlab="", ylab = "Global Active Power (kilowatts)")
dev.copy(png,"plot2.png",width = 480, height = 480)
dev.off()