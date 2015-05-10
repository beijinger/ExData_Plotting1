plot3 <- function() {

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

      plot(shortDT$Timestamp,shortDT$Sub_metering_1,type="l",xlab="",
           ylab = "Energy sub metering")
      lines(shortDT$Timestamp,shortDT$Sub_metering_2,col="red")
      lines(shortDT$Timestamp,shortDT$Sub_metering_3,col="blue")

      ## when graph was reproduced in RStudio exactly as required, I noticed that
      ##legend was not being saved correctly as png file - text was sticking
      ## out of border box. In order to address the problem I removed the border
      ##of the legend with bty="n" option, moved it away from corner with
      ##inset=0.15 option and reduced fint size with cex=0.8. Taking out those
      ##minor modifications brings us back to the plot in instructions, but
      ##yields a png file with completely corrupted legend box.

      legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
             col=c("black","red","blue"),inset=0.15,lty=c(1,1,1),bty="n",cex=0.8)
      dev.copy(png,file="plot3.png")
      dev.off()


}



