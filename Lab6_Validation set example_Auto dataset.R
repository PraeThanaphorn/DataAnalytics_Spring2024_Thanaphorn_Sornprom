#Inclass_exercises
#Validation set example with Auto dataset

library(ISLR)
library(MASS)
set.seed(1)

help("sample")
train = sample(392,196)
lm.fit <- lm(mpg ~ horsepower, data = Auto, subset = train)
summary(lm.fit)
mean((Auto$mpg-predict(lm.fit, Auto))[-train]^2)

lm.fit2 <- lm(mpg ~ poly(horsepower, 2), data=Auto, subset=train) #Quadratic
mean((Auto$mpg-predict(lm.fit2, Auto))[-train]^2)

lm.fit3 <- lm(mpg ~ poly(horsepower, 3), data=Auto, subset=train) #Cubic
mean((Auto$mpg-predict(lm.fit3, Auto))[-train]^2)

## on the validation set
set.seed(2)
train = sample(392, 196)
lm.fit <- lm(mpg ~ horsepower, data = Auto, subset = train)
mean((Auto$mpg-predict(lm.fit, Auto))[-train]^2)

lm.fit2 <- lm(mpg~poly(horsepower,2), data = Auto, subset = train)
mean((Auto$mpg-predict(lm.fit2, Auto))[-train]^2)

lm.fit3 <- lm(mpg~poly(horsepower,3), data = Auto, subset = train)
mean((Auto$mpg-predict(lm.fit3, Auto))[-train]^2)

