#PAC Iris data (Inclass-exercise)

data("iris")
head(iris) #head of the iris dataset

irisdata1 <- iris[,1:4]
irisdata1
head(irisdata1)

#Read the documentation for the PCA
help("princomp")
principal_components <- princomp(irisdata1, cor=TRUE, score=TRUE)
summary(principal_components)
## based on the generated results, we can keep two features and drop two features.
##In order to know which variables need to be dropped, we need to plot graphs.
##We cannot drop the parameters that are close.
plot(principal_components)
plot(principal_components, type = "l")

help("biplot")
biplot(principal_components)
##This plot shows that Patel Length and Patel Width are close and 
##We cannot drop these two variables.


