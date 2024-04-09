# perform cross-validation for an LTS regression model
help(ltsReg) #ltsReg: Least Trimmed Squares Robust Regression

fitLts <- ltsReg(Y ~ ., data = coleman)
summary(fitLts)

cvFitLts <- cvLts(fitLts, cost = rtmspe, K = 5, R = 10, fit = "both", trim = 0.1, seed = 1234)

# compare original and reshaped object
cvFitLts
cvReshape(cvFitLts)

