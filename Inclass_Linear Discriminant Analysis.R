# Linear Discriminant Analysis Example using Iris dataset.
# In order to use the lda() function, you need to have the MASS library.
# Multiclass Classification 
library(MASS)
names(iris)
dim(iris) 
# check the dimensions of the iris dataset, you will see 150 rows 
#and 5 columns
head(iris)

# setting the seed value
set.seed(555)
Train <- sample(1:nrow(iris), nrow(iris)/2)
iris_Train <- iris[Train,] # Traning dataset
irist_Test <- iris[-Train,] # Testing dataset

# now we will use the lda() function to fit the model
fit1 <- lda(Species ~ Sepal.Length + Sepal.Width + 
              Petal.Length + Petal.Width, data = iris_Train)
summary(fit1)

predict1 <- predict(fit1, iris_Train)
predict1_class <- predict1$class

# generating the confusion matrix using the table() function 
table1 <- table(predict1_class, iris_Train$Species)
table1
# Calculating the Accuracy of the prediction
accuracy <- sum(diag(table1))/sum(table1)
accuracy

error <- 1-accuracy
error
