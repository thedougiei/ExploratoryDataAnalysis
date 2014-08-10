setwd("N:/coursera/JHU-ExploratoryDataAnalyis/Assignment1")

## read the source file
## subset for the days that we want
## create a new DateTime field

## note that I renamed the source file to hpc.txt after extracting

df <- read.csv("hpc.txt", sep = ";", na.strings = "?", stringsAsFactors = F,
               colClasses = c("character","character","numeric","numeric", 
                              "numeric","numeric","numeric","numeric","numeric") )

df1<- subset(df, Date == "1/2/2007"  | Date == "2/2/2007")
df1$DateTime <- strptime(paste(df1$Date, df1$Time), format="%d/%m/%Y %H:%M:%S")


## plot3

par(bg=NA)  
plot(df1$DateTime, df1$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
lines(df1$DateTime, df1$Sub_metering_2, type = "l", col = "red")
lines(df1$DateTime, df1$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"),legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1,pt.cex = 1, cex = 1
)

dev.copy(png, "plot3.png", units="px", width = 480, height = 480)
dev.off()
