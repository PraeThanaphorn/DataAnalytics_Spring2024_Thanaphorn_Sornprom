#Titanic data

data(Titanic)
mdl <- naiveBayes(Survived ~ ., data = Titanic)
mdl

