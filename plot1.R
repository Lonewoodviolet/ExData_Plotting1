

project <- read.csv("./household_power_consumption.txt", sep=';')
project$Date <- as.Date(project$Date, format="%d/%m/%Y")

project1 <- subset(project, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
projtect1$datetime <- as.POSIXct(paste(project1$Date, project1$Time))

plot1 = hist(as.numeric(as.character(project1$Global_active_power)), col= "red", 
             main= paste("Global Active Power"),
             xlab= "Global Active Power (killowatt)")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
