

project <- read.csv("./household_power_consumption.txt", sep=';')
project$Date <- as.Date(project$Date, format="%d/%m/%Y")

project1 <- subset(project, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
projtect1$datetime <- as.POSIXct(paste(project1$Date, project1$Time))

with(project1, {
        plot(datetime, Global_active_power, type="l",
             xlab="", ylab= "Global Active Power (kilowatts)")
})

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
