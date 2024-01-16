#Lab 0,1_Thanaphorn Sornprom
rm(list = ls())

###Practice1###
install.packages("MASS")
library(MASS)
attach(Boston)
head(Boston)
dim(Boston) #dimensions of the dataset
names(Boston) #column names
str(Boston)
nrow(Boston)
ncol(Boston)
summary(Boston)
summary(Boston$crim)

install.packages("ISLR")
library(ISLR)
data(Auto)
head(Auto)
names(Auto)
summary(Auto)
summary(Auto$mpg)
fivenum(Auto$mpg)
boxplot(Auto$mpg)
hist(Auto$mpg)
summary(Auto$horsepower)
summary(Auto$weight)
fivenum(Auto$weight)
boxplot(Auto$weight)
mean(Auto$weight)
median(Auto$weight)

###Practice2###
days = c('Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun')
temp = c(28, 30.5, 32, 31.2, 29.3, 27.9, 26.4)
#snowed = c('T', 'T', 'F', 'F','T','T','F') #This is a mistake as we cannot convert the boolean to be a number (0 and 1)
snowed = c(TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, FALSE)
class(snowed)
help("data.frame")

#Create data frame
RPI_Weather_Week = data.frame(days, temp, snowed) #data frame function
RPI_Weather_Week
head(RPI_Weather_Week)

str(RPI_Weather_Week)
summary(RPI_Weather_Week)

RPI_Weather_Week[1,]
RPI_Weather_Week[,1]

RPI_Weather_Week[,'snowed']
RPI_Weather_Week[,'days']
RPI_Weather_Week[,'temp']
RPI_Weather_Week[1:5, c("days","temp")]

RPI_Weather_Week$temp
RPI_Weather_Week$days
subset(RPI_Weather_Week,subset = snowed == TRUE)

dec.snow <- order(-RPI_Weather_Week$temp)
dec.snow

#create an empty dataframe
empty.DataFrame <- data.frame()
v1 <- 1:10
v1

letters
v2 <- letters[1:10]
df <- data.frame(col.name.1=v1, col.name.2=v2)
df

#import data and export data
#write to a csv file
write.csv(df, file='saved_df1.csv')
df2<-read.csv('saved_df1.csv')
df2

####2010_EPI_data
install.packages("csv")
library(csv)
data_2010EPI <- read.csv(file.choose(), header = T)
data_2010EPI
str(data_2010EPI)
View(data_2010EPI)
names(data_2010EPI) <- data_2010EPI[1,]
data_2010EPI <- data_2010EPI[-1,]
str(data_2010EPI)
View(data_2010EPI)
head(data_2010EPI)

EPI_data_2010 = as.numeric(data_2010EPI$EPI)
print(EPI_data_2010)
summary(EPI_data_2010)
fivenum(EPI_data_2010)
boxplot(EPI_data_2010)
hist(EPI_data_2010)


rm(list = ls())
######EPI_data
#data_EPI <- read.csv(file.choose(), header = T) #header is a column's name.
EPI_data <- read.csv("EPI_Data.csv")
EPI_data
View(EPI_data)
str(EPI_data)
summary(EPI_data)
EPI <- EPI_data$EPI
EPI
boxplot(EPI)
hist(EPI)
fivenum(EPI)
