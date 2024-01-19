#Lab1
#Create a dataframe
days = c('Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun')
temp = c(28, 30.5, 32, 31.2, 29.3, 27.9, 26.4)
#snowed = c('T', 'T', 'F', 'F','T','T','F') #This is a mistake as we cannot convert the boolean to be a number (0 and 1)
snowed = c(TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, FALSE)
class(snowed)
help("data.frame")

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

sorted.snowed <- order(RPI_Weather_Week['snowed'])
sorted.snowed
RPI_Weather_Week[sorted.snowed,]

#descending snowed
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
names(data_2010EPI) <- as.matrix(data_2010EPI[1,])
data_2010EPI <- data_2010EPI[-1,]
data_2010EPI[] <- lapply(data_2010EPI, function(x)type.convert(as.character(x)))
data_2010EPI
attach(data_2010EPI)
fix(data_2010EPI)
data_2010EPI
tf <- is.na(data_2010EPI)
tf
E <- data_2010EPI[!tf]
E

str(data_2010EPI)
View(data_2010EPI)
head(data_2010EPI)
shapiro.test(data_2010EPI$EPI)
summary(data_2010EPI)
fivenum(data_2010EPI$EPI, na.rm=TRUE)
stem(data_2010EPI$EPI)
hist(data_2010EPI$EPI)
hist(data_2010EPI$EPI, seq(30., 95., 1.0), prob = TRUE)
lines(density(data_2010EPI$EPI, na.rm=TRUE, bw=1.))
rug(data_2010EPI$EPI)

#Exercise 1: fitting a distribution beyond histograms
plot(ecdf(data_2010EPI$EPI),do.points=FALSE,verticals=TRUE) #cumulative density function
par(pty="s")

#Quantile-Quantile
qqnorm(data_2010EPI$EPI)
qqline(data_2010EPI$EPI)

#Make a Q-Q plot
x <- seq(30,95,1)
qqplot(qt(ppoints(250),df=5),x,xlab="Q-Q plot for t dsn")
qqline(x)

#Daly data
plot(ecdf(data_2010EPI$DALY),do.points=FALSE,verticals=TRUE) #cumulative density function
par(pty="s")

#Quantile-Quantile
qqnorm(data_2010EPI$DALY)
qqline(data_2010EPI$DALY)

#Water_H
plot(ecdf(data_2010EPI$WATER_H),do.points=FALSE,verticals=TRUE) #cumulative density function
par(pty="s")

#Quantile-Quantile
qqnorm(data_2010EPI$WATER_H)
qqline(data_2010EPI$WATER_H)

boxplot(data_2010EPI$EPI, data_2010EPI$DALY)
qqplot(data_2010EPI$EPI, data_2010EPI$DALY)

help(distributions)
