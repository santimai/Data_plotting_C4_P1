#Course Project 1

library(dplyr)
library(stringr)
library(ggplot2)
library(readr)

setwd("C:/Users/CPUser/Desktop/Data analytics/C4_Exploratory Data Analysis/exdata_data_household_power_consumption")
df <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)

dff <- filter(df,Date %in% c("1/2/2007" ,"2/2/2007" ))

