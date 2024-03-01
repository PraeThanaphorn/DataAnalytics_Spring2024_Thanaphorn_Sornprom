mtcars
head(mtcars)
str(mtcars)

model1 <- lm(mpg~cyl+wt, data=mtcars)
model1

help("cooks.distance")
plot(model1, pch=18, col = 'red', which = c(4))

cooks.distance(model1)
CooksDistance <- cooks.distance(model1)
CooksDistance

round(CooksDistance,5)
sort(round(CooksDistance, 5))


#Outlier Detection
library(ISLR)
head(Hitters)
dim(Hitters)
is.na(Hitters)

HittersData <- na.omit(Hitters)
dim(HittersData)
glimpse(HittersData)
head(HittersData)

SalaryPredictModel1 <- lm(Salary ~., data=HittersData)
summary(SalaryPredictModel1)

#Cook's Distance
cooksD <- cooks.distance(SalaryPredictModel1)
influential <- cooksD[(cooksD > (3*mean(cooksD, na.rm=TRUE)))]
influential

names_of_influential <- names(influential)
names_of_influential

outliers <- HittersData[names_of_influential,]
Hitters_Without_Outliers <- HittersData %>% anti_join(outliers)

#Model2: without the outliers
SalaryPredictModel2 <- lm(Salary ~., data=Hitters_Without_Outliers)
summary(SalaryPredictModel2)

#Normality Tests
help("rnorm")
set.seed(10)
data1 <- rnorm(50)

set.seed(30)
data2 <- rnorm(50)

help("shapiro.test")
shapiro.test(data1)
hist(data1, col='green')

shapiro.test(data2)
hist(data2, col='steelblue')

set.seed(0) #create dataset of 100 random values generated from a normal distribution
data <- rnorm(100)
shapiro.test(data)

set.seed(0)
help("rpois")
data <- rpois(n=100, lambda = 3)
shapiro.test(data)
hist(data, col='yellow')

#Anderson-Darling test for normality
help("ad.test")
library(nortest)
set.seed(1)

x <- rnorm(100, 0, 1)

ad.test(x)

help("runif")
x <- runif(100, 0, 1)
ad.test(x)
