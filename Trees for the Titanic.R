install.packages("titanic")
library(titanic)
knitr::kable(head(titanic_train))

library(dplyr)
install.packages("tibble")
library(tibble)
install.packages("explore")
library(explore)

data(Titanic)
str(Titanic)
View(Titanic)

titanic <- as_tibble(Titanic)
titanic

#Explore dataset
titanic %>% describe_tbl(n = n)

titanic %>% describe()

titanic %>% head(10)

titanic %>% explore(Class, n = n)

titanic %>% describe(Class, n = n)

titanic %>% explore_all(n = n)

titanic %>% explore(Class, target = Survived, n = n, split = FALSE)

titanic %>% explore(Class, target = Survived, n = n, split = TRUE)

titanic %>% explore(Sex, target = Survived, n = n)

titanic %>% explore(Age, target = Survived, n = n)

titanic %>% explain_tree(target = Survived, n = n)

#Classify age based on class
titanic %>% explore(Age, target = Class, n = n)

#Classify sex based on class
titanic %>% explore(Sex, target = Class, n = n)

#Classify survived people based on class
titanic %>% explore(Survived, target = Class, n=n)


train <- read.csv("train.csv")
str(train)

test <- read.csv("test.csv")
str(test)

#Find survival rate
table(train$Survived)

#Find survived rate in population
prop.table(table(train$Survived))

#Compare survived rate between female and male
table(train$Sex, train$Survived)

prop.table(table(train$Sex,train$Survived),1)

#Create the column child, and indicate whether child or no child
train$Child <- NA
train$Child[train$Age < 18] <- 1
train$Child[train$Age >= 18] <- 0

train$Child

#Compare survival rate between children and adults
prop.table(table(train$Child,train$Survived),1)

#Create a decision tree
require(rpart)
titanic_rpart <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data = train, method = "class")
summary(titanic_rpart)
titanic_rpart
plot(titanic_rpart, uniform=TRUE, main="Classification Tree for Survived passengers")
text(titanic_rpart, uniform=TRUE, main="Classification Tree for Survived passengers")

install.packages("rattle")
library(rattle)

install.packages("rpart.plot")
library(rpart.plot)

install.packages("RColorBrewer")
library(RColorBrewer)
fancyRpartPlot(titanic_rpart)

#Making predictions
prediction <- predict(titanic_rpart, test, type = "class")
prediction

solution <- data.frame(PassengerId = test$PassengerId, Survived = prediction)

nrow(solution)
ncol(solution)

titanic_rpart2 <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, 
                       data = train, method = "class", control = rpart.control(minsplit = 50, cp = 0))

# Visualize titanic_rpart2
fancyRpartPlot(titanic_rpart2)

train_two <- train
train_two$family_size <- train_two$SibSp + train_two$Parch + 1

# Finish the command
titanic_rpart3 <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked + family_size, 
                      data = train_two, method = "class")

# Visualize your new decision tree
fancyRpartPlot(titanic_rpart2)

train_new <- train
titanic_rpart4 <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, 
                      data = train_new, method = "class")

# Visualize titanic_rpart4
fancyRpartPlot(titanic_rpart4)

test_new <- test

#Make a Prediction
prediction4 <- predict(titanic_rpart4, test_new, type = "class")

#Generate results
solution <- data.frame(PassengerId = test_new$PassengerId, Survived = prediction)
write.csv(solution, file = "my_solution.csv", row.names = FALSE)
table(solution)
