require(randomForest)
data("kyphosis")
str(kyphosis)
fitKF <- randomForest(Kyphosis ~ Age + Number + Start,   data=kyphosis)
print(fitKF) 	# view results
importance(fitKF) # importance of each predictor
#
fitSwiss <- randomForest(Fertility ~ Agriculture + Education + Catholic, data = swiss)
print(fitSwiss) # view results
importance(fitSwiss) # importance of each predictor
varImpPlot(fitSwiss)

plot(fitSwiss)

getTree(fitSwiss,1, labelVar=TRUE)

help(randomForest) # look at all the package contents and the randomForest method options

# look at rfcv - random forest cross-validation - 
help(rfcv)

# other data....
data(imports85)
str(imports85)

is.na(imports85$price)
# perform randomForest and other tree methods.....
fitKF <- randomForest(price ~ highwayMpg + compressionRatio + engineSize + horsepower
                      ,data=na.omit(imports85))
print(fitKF)
