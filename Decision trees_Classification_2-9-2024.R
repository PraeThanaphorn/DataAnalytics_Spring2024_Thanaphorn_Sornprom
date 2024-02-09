#Decision trees/ Classification

install.packages("rpart")
library(rpart)

install.packages("rpart.plot")
library(rpart.plot)

#iris dataset
iris #show all observation points
dim(iris)
str(iris)
head(iris)

#create a sample from the iris datasets
s_iris <- sample(150,100) #random sample (if the seed is not set, the value will change overtime.)
s_iris
length(s_iris)

#create testing and training datasets
iris_train <- iris[s_iris,]
iris_test <- iris[-s_iris,] #the left datasets will be in a testing dataset group

dim(iris_test)
dim(iris_train)

#generate the decision tree model
decisionTreeModel <- rpart(Species~., iris_train, method = "class")
#decisionTreeModel_1 <- rpart(Species~Sepal.Length+Sepal.Width, iris_train, method = "class")
decisionTreeModel
#decisionTreeModel_1

#plotting the decision tree model
rpart.plot(decisionTreeModel)
rpart.plot(decisionTreeModel_1)

