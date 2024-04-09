set.seed(2143) # set seed for reproducibility
cvFolds(n = 20, K = 5, type = "random")
cvFolds(n = 20, K = 5, type = "consecutive")
cvFolds(n = 20, K = 5, type = "interleaved")
cvFolds(n = 20, K = 5, R = 10)

help("cvFolds")
#n is the no. of observations to be split into folds.
#k is the no. of flods into which the observations should be split.
#type is the type of folds to be generated.