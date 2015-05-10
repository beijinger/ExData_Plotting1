plot1 <- function() {

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
      hist(as.numeric(shortDT$Global_active_power),col="red",
           xlab="Global Active Power (kilowatts)",main="Global Active Power")
      dev.copy(png,file="plot1.png")
      dev.off()

}



