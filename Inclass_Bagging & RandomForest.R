#Bagging & RandomForest 
library(randomForest)
set.seed(1)
bag.boston = randomForest(medv~., data=Boston, subset=train,
                          mtry = 13, importance = TRUE)
bag.boston

##Set the same seed when you want to make a comparison.
yhat.bag = predict(bag.boston, newdata = Boston[-train,])
plot(yhat.bag, boston.test)
abline(0,1)
mean((yhat.bag-boston.test)^2)

bag.boston = randomForest(medv~., data=Boston, subset=train, mtry = 13, ntree = 25)
yhat.bag = predict(bag.boston, newdata = Boston[-train,])
mean((yhat.bag-boston.test)^2) ##MSE

set.seed(1)
rf.boston = randomForest(medv~., data=Boston, subset=train,
                         mtry=6, importance = TRUE) 
yhat.rf = predict(rf.boston, newdata=Boston[-train,])
mean((yhat.rf-boston.test)^2)

importance(rf.boston)
varImpPlot(rf.boston)
