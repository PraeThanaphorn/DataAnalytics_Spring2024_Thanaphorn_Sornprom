#KNN
#Import abalone data set

abalone <- read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data"),
                    header = FALSE, sep = ",")

#Add column names
colnames(abalone) <- c("sex", "length", "diameter", "height", "whole_weight", "shucked_weight", "viscera_weight", "shell_weight", "rings")

#summary on abalone
summary(abalone)

#structure of the abolone data
str(abalone)

#summary of the abalone rings column
summary(abalone$rings)

#break the rings variable into three levels
abalone$rings <- as.numeric(abalone$rings)
abalone$rings <- cut(abalone$rings, br = c(-1,8,11,35), labels=c("yong", "adult", "old"))
abalone$rings <- as.factor(abalone$rings)
summary(abalone$rings)

#Remove the sex variable 
z <- abalone
aba <- abalone
aba$sex < NULL

#Normalize the data using min max normalization
normalize <- function(x){
  return((x-min(x))/ (max(x)-min(x)))
}

aba

#aba[1:7] <- as.data.frame(lapply(aba[1:7], normalize))
aba[2:8] <- as.data.frame(lapply(aba[2:8], normalize))

summary(aba$shucked_weight)

#After Normalization

#Split the data into training and testing sets
ind <- sample(2, nrow(aba), replace = TRUE, prob = c(0.7, 0.3))

KNNtrain <- aba[ind==1,]
KNNtest <- aba[ind==2,]

sqrt(2918)

#install class package to use KNN function
install.packages("class")
library(class)
KNNpred <- knn(train = KNNtrain[2:8], test = KNNtest[2:8], cl = KNNtrain$rings, k = 55)
KNNpred

table(KNNpred)
