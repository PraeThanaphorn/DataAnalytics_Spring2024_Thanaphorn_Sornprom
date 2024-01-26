##Lab1_Part 2: January 26, 2024
#Exercise 1: fitting a distribution beyond histograms
rm(list = ls())
install.packages("csv")
library(csv)
EPI_data <- read.csv("EPI_Data.csv")
str(EPI_data)
View(EPI_data)

EPI <- EPI_data$EPI #Select only EPI variable
str(EPI)
plot(ecdf(EPI), do.points=FALSE, verticals = TRUE) #Cumulative density function
help("qqnorm")
par(pty="s")
qqnorm(EPI) #qqplot
qqline(EPI) #add line to the qqplot

#Make a Q-Q plot against the generating distribution
x <- seq(30, 95, 1)
qqplot(qt(ppoints(250), df=5), x, xlab = "Q-Q plot for t dsn")
qqline(x)

#Exercise 1 code
plot(ecdf(EPI_data$EPI), do.points=FALSE, verticals=TRUE) #plot cumulative graph
plot(ecdf(EPI_data$EPI), do.points=TRUE, verticals=TRUE) #add points on the plot
par(pty="s")
help("qqnorm")
help("qqplot")
qqnorm(EPI_data$EPI) #make a Q-Q plot
qqline(EPI_data$EPI) #add a line to the plot
x1 <- seq(30, 95, 1)
x1
x2 <- seq(30, 95, 2)
x2
x3 <- seq(30, 96, 2)
x3
qqplot(qt(ppoints(250), df=5), x2, xlab="Q-Q plot")
qqline(x2)

qqplot(qt(ppoints(250), df=5), x3, xlab="Q-Q plot")
qqline(x3)

#Consider Daly variable
plot(ecdf(EPI_data$DALY), do.points=FALSE, verticals=TRUE)
plot(ecdf(EPI_data$DALY), do.points=TRUE, verticals=TRUE)
qqnorm(EPI_data$DALY)
qqline(EPI_data$DALY)
qqplot(qt(ppoints(250), df=5), x2, xlab="Q-Q plot")
qqline(x2)

#Consider Water_H variable
plot(ecdf(EPI_data$WATER_H), do.points=FALSE, verticals=TRUE)
plot(ecdf(EPI_data$WATER_H), do.points=TRUE, verticals=TRUE)
qqnorm(EPI_data$WATER_H)
qqline(EPI_data$WATER_H)
qqplot(qt(ppoints(350), df=2), x2, xlab="Q-Q plot")
qqline(x2)

#Apply qqplot to compare two variables
qqplot(EPI_data$EPI, EPI_data$DALY)
qqplot(EPI_data$EPI, EPI_data$WATER_H)
qqplot(EPI_data$DALY, EPI_data$WATER_H)

#Compare distributions via boxplot
boxplot(EPI_data$EPI, EPI_data$DALY)
boxplot(EPI_data$EPI, EPI_data$WATER_H)
boxplot(EPI_data$DALY, EPI_data$WATER_H)

#Select Envhealth variable
Envhealth <- EPI_data$ENVHEALTH

#Select Ecosystem
Ecosystem <- EPI_data$ECOSYSTEM

#Select AIR_E
AIR_E <- EPI_data$AIR_E

#Select WATER_E
WATER_E <- EPI_data$WATER_E

qqplot(Envhealth, Ecosystem)
boxplot(Envhealth, Ecosystem)
qqplot(AIR_E, WATER_E)
boxplot(AIR_E, WATER_E)

#Exercises from R cookbook

#install packages
install.packages(c("ggplot2", "gcookbook"))

#load packages
library(ggplot2)
library(gcookbook)

#Creating a scatter plot
plot(mtcars$wt, mtcars$mpg)
#Use ggplot2 package to get a similar result
qplot(mtcars$wt, mtcars$mpg)

qplot(wt, mpg, data=mtcars) #In case that two vectors are in the same data frame
ggplot(mtcars, aes(x=wt, y=mpg))+geom_point()

#Creating a line graph
plot(pressure$temperature, pressure$pressure, type="l")
points(pressure$temperature, pressure$pressure) #add points into the line

#Add additional lines
lines(pressure$temperature, pressure$pressure/2, col="red") #add a new line with red color
points(pressure$temperature, pressure$pressure/2, col="blue") #add blue points on the red line

qplot(pressure$temperature, pressure$pressure, geom = "line")
qplot(temperature, pressure, data=pressure, geom = "line")
# This is equivalent to:
ggplot(pressure, aes(x=temperature, y=pressure))+geom_line()
ggplot(pressure, aes(x=temperature, y=pressure))+geom_line()+geom_point() #add points into the graph

#Creating Bar graphs
barplot(BOD$demand, names.arg = BOD$Time)
table(mtcars$cyl)

library(ggplot2)
#qplot(BOD$Time, BOD$demand, geom="bar", stat = "identity")
#qplot(factor(BOD$Time, BOD$demand, geom="bar", stat="identity"))

barplot(table(mtcars$cyl)) #generate a table of counts
qplot(mtcars$cyl) #cyl is continuous
qplot(factor(mtcars$cyl)) #treat cyl as discrete

#qplot(Time, demand, data=BOD, geom="bar", stat="identity")
#qplot(factor(BOD$Time), BOD$demand, geom="bar", stat="identity")

#Bar graph of counts
qplot(factor(cyl), data=mtcars)
#This is equivalent to:
ggplot(mtcars, aes(x=factor(cyl)))+geom_bar()

#Creating Histogram
hist(mtcars$mpg)
hist(mtcars$mpg, breaks = 10) #Specific approx. number of bins with breaks
hist(mtcars$mpg, breaks = 5)
hist(mtcars$mpg, breaks = 12)
qplot(mtcars$mpg)
qplot(mpg, data=mtcars, binwidth=4)
ggplot(mtcars, aes(x=mpg))+geom_histogram(binwidth = 4)
ggplot(mtcars, aes(x=mpg))+geom_histogram(binwidth = 5)

#Creating a box plot
plot(ToothGrowth$supp, ToothGrowth$len)
#Formula Syntax
boxplot(len ~ supp, data=ToothGrowth)
boxplot(len ~ supp+dose, data=ToothGrowth)

library(ggplot2)
qplot(ToothGrowth$supp, ToothGrowth$len, geom="boxplot")
qplot(supp, len, data = ToothGrowth, geom="boxplot") #Two variables are in the same dataframe.
#This is equivalent to:
ggplot(ToothGrowth, aes(x=supp, y=len))+geom_boxplot()

#Using three separate vectors
qplot(interaction(ToothGrowth$supp, ToothGrowth$dose), ToothGrowth$len, geom = "boxplot")

#Alternatively, get the colums from the data frame
qplot(interaction(supp, dose), len, data=ToothGrowth, geom="boxplot")
#This is equivalent to:
ggplot(ToothGrowth, aes(x=interaction(supp, dose), y=len))+geom_boxplot()

#Plotting a Function Curve
curve(x^3 - 5*x, from=-4, to=4)

#Plot a user-defined function
myfunction <- function(xvar){
  1/(1+exp(-xvar + 10))
}
curve(myfunction(x), from=0, to=20)
#Add a line:
curve(1-myfunction(x), add=TRUE, col="red")

library(ggplot2)
#This sets the x range from 0 to 20.
#qplot(c(0,20), fun=myfunction, stat = "function", geom = "line")
ggplot(data.frame(x=c(0,20)), aes(x=x))+stat_function(fun=myfunction, geom="line")
