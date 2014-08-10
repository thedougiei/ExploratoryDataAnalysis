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
## Plot 2
par(bg=NA)  ##setting transparent background (same as example plots)
plot(df1$DateTime, df1$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## saving the plot as .png file & configuring dimensions (same as example plots)
dev.copy(png, "plot2.png", units="px", width = 480, height = 480)
dev.off()

