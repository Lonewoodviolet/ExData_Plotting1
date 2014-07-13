

project <- read.csv("./household_power_consumption.txt", sep=';')
project$Date <- as.Date(project$Date, format="%d/%m/%Y")

project1 <- subset(project, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
projtect1$datetime <- as.POSIXct(paste(project1$Date, project1$Time))

par(mfrow = c(2, 2))
with(project1, {
        plot(datetime, Global_active_power, type="l", 
             xlab="", ylab="Global Active Power (kilowatts)")
        
        plot(datetime, Voltage, type="l", 
             xlab="datetime" , ylab="Voltage")
        
        plot(datetime, Sub_metering_1, type="l", col="black", 
             xlab="", ylab="Energy sub metering")
        lines(datetime, Sub_metering_2,col='Red')
        lines(datetime, Sub_metering_3,col='Blue')
        legend("topright", col=c("black", "red", "blue"),
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        plot(datetime, Global_reactive_power, type="l", 
             xlab="datetime", ylab="Global_reactive_power")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
