nyt1<-read.csv("nyt1.csv")
str(nyt1)
View(nyt1)

nyt1<-nyt1[which(nyt1$Impressions>0 & nyt1$Clicks>0 & nyt1$Age>0),]
nnyt1<-dim(nyt1)[1]		# shrink it down!
nnyt1

sampling.rate=0.9
num.test.set.labels=nnyt1*(1.-sampling.rate)
training <-sample(1:nnyt1,sampling.rate*nnyt1, replace=FALSE)
training
str(training)

train<-subset(nyt1[training,],select=c(Age,Impressions))
str(train)

testing<-setdiff(1:nnyt1,training)
test<-subset(nyt1[testing,],select=c(Age,Impressions))

cg<-nyt1$Gender[training]
cg

true.labels<-nyt1$Gender[testing]

install.packages("caret")
library(caret)

library(class)
classif<-knn(train,test,cg,k=5) #
classif
attributes(.Last.value) 

