# Data Vehicle (four classes): Bagging
library(ipred)
library(rpart)
library(mlbench)
library(adabag)
data(Vehicle)
str(Vehicle)

l <- length(Vehicle[,1])
sub <- sample(1:l,2*l/3)
Vehicle.bagging <- bagging(Class ~.,data=Vehicle[sub, ],mfinal=40, 
	control=rpart.control(maxdepth=5))
print(Vehicle.bagging)
summary(Vehicle.bagging)

Vehicle.bagging.pred <- predict.bagging(Vehicle.bagging,newdata=Vehicle[-sub, ])

Vehicle.bagging.pred$confusion
Vehicle.bagging.pred$error
