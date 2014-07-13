

project <- read.csv("./household_power_consumption.txt", sep=';')
project$Date <- format(as.Date(project$Date, "%d/%m/%Y")

project1 <- subset(project, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
projtect1$datetime <- as.POSIXct(paste(project1$Date, project1$Time))


with(project1, {
        plot(datetime, Sub_metering_1, col="black", 
             ylab="Energy sub metering", xlab="")
        lines(datetime, Sub_metering_2, col="red")
        lines(datetime, Sub_metering_3, col="blue") 
})
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
