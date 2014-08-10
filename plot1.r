setwd("N:/coursera/JHU-ExploratoryDataAnalyis/Assignment1")

df <- read.csv("hpc.txt", sep = ";", na.strings = "?", stringsAsFactors = F,
               colClasses = c("character","character","numeric","numeric", 
                              "numeric","numeric","numeric","numeric","numeric") )

df1<- subset(df, Date == "1/2/2007"  | Date == "2/2/2007")
df1$DateTime <- strptime(paste(df1$Date, df1$Time), format="%d/%m/%Y %H:%M:%S")
  



## plot1
par(mfrow =c(1,1),bg=NA)
hist(df1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## saving histogram as .png file & configuring dimensions (same as example plots)

dev.copy(png, "plot1.png", units="px", width = 480, height = 480)
dev.off()


