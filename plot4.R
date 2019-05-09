#Course Project 1

library(dplyr)
library(stringr)
library(ggplot2)
library(readr)

setwd("C:/Users/CPUser/Desktop/Data analytics/C4_Exploratory Data Analysis/exdata_data_household_power_consumption")


#load data
df <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)

#filter data 
dff <- filter(df,Date %in% c("1/2/2007" ,"2/2/2007" ))
#Combine Date and Time column
dff$DateTime <- as.POSIXct(paste(dff$Date," ", dff$Time), format="%d/%m/%Y %H:%M:%S")

dff <- select(dff,-Time,-Date,)


#convert
dff$Global_active_power <- as.numeric(as.character(dff$Global_active_power))
str(dff)

#plot4

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(dff,{ 
    plot(DateTime, Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = " ")
    plot(DateTime, Voltage,type = "l",ylab = "Voltage (volt)",xlab = " ")
    plot(DateTime,Sub_metering_1,type = "l",ylab = "Global Active Power (kilowatts)",xlab = " ")  
    lines(DateTime,Sub_metering_2,col='Red') 
    lines(DateTime,Sub_metering_3,col = "blue")
    legend("topright", lty = 1, lwd = 0.5, bty = "n", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
    plot(DateTime,Global_reactive_power, type="l",ylab="Global Rective Power (kilowatts)",xlab="")
    
})
dev.copy(png, file = "plot4.png", height=480, width=480)
dev.off()