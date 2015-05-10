plot4 <- function() {

      library(plyr)
      library(datasets)
      library(data.table)

      dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(dataset_url,"electric.zip")
      unzip("electric.zip",exdir = getwd())
      DT <- fread("household_power_consumption.txt")

      DATES <- c("1/2/2007","2/2/2007")
      shortDT <- as.data.frame(DT[DT$Date %in% DATES,])
      Timestamp = strptime(paste(shortDT$Date,shortDT$Time),"%d/%m/%Y %H:%M:%S")
      shortDT <- mutate(shortDT,Timestamp=Timestamp)
      par(mfrow=c(2,2))
      plot(shortDT$Timestamp,shortDT$Global_active_power,type="l",xlab="",
           ylab="Global Active Power")
      plot(shortDT$Timestamp,shortDT$Voltage,type="l",xlab="datetime",
           ylab="Voltage")
      plot(shortDT$Timestamp,shortDT$Sub_metering_1,type="l",xlab="",
           ylab = "Energy sub metering")
      lines(shortDT$Timestamp,shortDT$Sub_metering_2,col="red")
      lines(shortDT$Timestamp,shortDT$Sub_metering_3,col="blue")
      legend("top", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
             col=c("black","red","blue"),inset=0.05,lty=c(1,1,1),bty="n",cex=0.8)

      ## when graph was reproduced in RStudio exactly as required, I noticed that
      ##legend was not being saved correctly as png file - In order to address
      ##the problem I moved it from topright to top with small inset=0.05 option
      ##and reduced fint size with cex=0.8. Taking out those
      ##minor modifications brings us back to the plot in instructions, but
      ##yields a png file with completely corrupted legend.

      plot(shortDT$Timestamp,shortDT$Global_reactive_power,type="l",xlab="datetime",
           ylab="Global_reactive_power")
      dev.copy(png,file="plot4.png")
      dev.off()

}



