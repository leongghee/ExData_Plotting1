library(data.table)
powerData<-read.table("household_power_consumption.txt",
                      header=TRUE,
                      sep=";",
                      na.strings="?")

powerData$Date<-as.Date(powerData$Date,"%d/%m/%Y")
powerData<- subset(powerData,Date>= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## plot 1

hist(powerData$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="Red")

dev.copy(png,"plot1.png",width = 480, height = 480)
dev.off()