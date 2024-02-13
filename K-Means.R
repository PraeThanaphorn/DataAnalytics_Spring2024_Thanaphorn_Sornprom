#K-Means
library(ggplot2)
head(iris)
str(iris)
summary(iris)

#Petal.Length and Petal.Width
help("sapply")

sapply(iris[,-5], var)
summary(iris)

#plot Sepal.Length vs. Sepal.Width using ggplot
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, col=Species))+geom_point()

#plot Petal.Length vs. Petal.Width using ggplot
ggplot(iris, aes(x=Petal.Length, y = Petal.Width, col=Species))+geom_point()

#K-means clustering
set.seed(300)
k.max <- 12

#wss: within sum of square
wss <- sapply(1:k.max, function(k){kmeans(iris[,3:4],k,nstart = 20,iter.max = 20)$tot.withinss})

plot(1:k.max, wss, type="b", xlab="Number of clusters(k)", ylab = "Within cluster sum of squares")

icluster <- kmeans(iris[,3:4],3,nstart = 20)
table(icluster$cluster, iris$Species)

#Classification trees
install.packages("rpart")
library(rpart)

install.packages("rpart.plot")
library(rpart.plot)

iris
dim(iris)

#create a sample from the iris dataset
s_iris <- sample(150, 100)
s_iris

#create testing and training sets
iris_train <- iris[s_iris,]
iris_test <- iris[-s_iris,]
dim(iris_test)
dim(iris_train)

#generate the decision tree model
DecisionTreeModel <- rpart(Species~.,iris_train, method="class")
DecisionTreeModel

#plot the decision tree model
rpart.plot(DecisionTreeModel)
