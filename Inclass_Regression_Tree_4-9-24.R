## Fitting a Regression Trees

library(MASS)
library(tree)
set.seed(1)
head(Boston)
train = sample(1:nrow(Boston), nrow(Boston)/2)
tree.boston = tree(medv~., Boston, subset = train)
summary(tree.boston)
plot(tree.boston)
text(tree.boston, pretty = 0)
cv.boston = cv.tree(tree.boston)
plot(cv.boston$size, cv.boston$dev, typ = 'b')

##Using the prune.tree function
prune.boston = prune.tree(tree.boston, best = 5)
plot(prune.boston)
text(prune.boston, pretty = 0)

yhat = predict(tree.boston, newdata = Boston[-train,])
boston.test = Boston[-train, "medv"]
plot(yhat, boston.test)

##Adding the abline()
abline(0,1)
mean((yhat-boston.test)^2) #MSE

#RMSE has the same units as the Y variable.
sqrt(mean((yhat-boston.test)^2)) #Root mean square error
