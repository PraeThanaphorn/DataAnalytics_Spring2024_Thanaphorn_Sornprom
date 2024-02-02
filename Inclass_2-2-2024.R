#Inclass_Friday 2-2-2024

rm(list = ls())
install.packages("csv")
library(csv)

#Read the csv file
multivariate <- read.csv("multivariate.csv")
str(multivariate)
View(multivariate)
attach(multivariate)
names(multivariate)
multivariate

#Create some Scatterplots
plot(Income, Immigrant, main = "Scatterplot")
plot(Immigrant, Homeowners)

#Fitting Linear Models 
mm <- lm(Homeowners ~ Immigrant)
mm
plot(Immigrant, Homeowners)

help(abline)
abline(mm)
abline(mm, col=2, lwd=3)

summary(mm)
attributes(mm)

#Multiple regression
mm$coefficients

HP = Homeowners/Population
PD = Population/area

ols2 <- lm(Immigrant ~ Income + Population + HP + PD)
summary(ols2)

cm <- coef(ols2) #store all coefficient
cm
