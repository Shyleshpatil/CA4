#Loading Libraries
library(plyr)
library(readr)

#Loading Dataset
completeData <- read.csv("C:/Users/Shylesh Patil/Downloads/CA3/completeDataFile.csv")

# Creating a sinngle CSV file.
property_complete <- read.csv('C:/Users/Shylesh Patil/Downloads/CA3/completeDataFile.csv')

str(property_complete)

#Data Cleaning
#Remove € symbol
property_complete$V5 = as.numeric(gsub("[\\€,]", "", property_complete$V5))
property_complete$V5

#displaying number of rows and columns
nrow(property_complete)
ncol(property_complete)

# Creating a complete Dataframe.
property_dataFrame <- data.frame(property_complete)

#Data Cleaning
#Column Name.
colnames(property_dataFrame) <- c("Date", "Address", "PostalCode", "County", "Price", "MarketPrice", "VATExcl", "PropertyDescription", "AdditionalInfo")
str(property_dataFrame)

# Checking for null Values in Dataframe.
sum(is.na(property_dataFrame))

# Creating a New Data frame with Date, County and Price.
newProperty_dataFrame <- data.frame(property_dataFrame$Date, property_dataFrame$County, property_dataFrame$Price)
str(newProperty_dataFrame)

# Naming the Column names for the new Data Frame
new_column <- c ("Date", "County", "Price")
colnames(newProperty_dataFrame) <- new_column

newProperty_dataFrame

# Filtering data for county "Donegal"
newProperty_dataFrame <- subset(newProperty_dataFrame, newProperty_dataFrame$County == 'Donegal')
str(newProperty_dataFrame)

newProperty_dataFrame

# Creating new Csv file with the filtered data.
write.csv(newProperty_dataFrame, "DonegalCounty.csv")

# Using the above generated csv file, new Data Frame is created.
donegalDataframe <- read.csv("DonegalCounty.csv")
str(donegalDataframe)
new_column1 <- c ("S.no", "Date", "County", "Price")
colnames(donegalDataframe) <- new_column1
str(donegalDataframe)
