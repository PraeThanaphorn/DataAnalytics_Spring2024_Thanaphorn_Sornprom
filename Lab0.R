#Lab 0
rm(list = ls())

###Practice1###
install.packages("MASS")
library(MASS)
attach(Boston)
head(Boston)
dim(Boston) #dimensions of the dataset
names(Boston) #column names
str(Boston)
nrow(Boston)
ncol(Boston)
summary(Boston)
summary(Boston$crim)

install.packages("ISLR")
library(ISLR)
data(Auto)
head(Auto)
names(Auto)
summary(Auto)
summary(Auto$mpg)
fivenum(Auto$mpg)
boxplot(Auto$mpg)
hist(Auto$mpg)
summary(Auto$horsepower)
summary(Auto$weight)
fivenum(Auto$weight)
boxplot(Auto$weight)
mean(Auto$weight)
median(Auto$weight)

## Data Types
# numerics,character and logical
temperature <- 24.5 # degrees in Fahrenheit 
class(temperature) # data type
RPI <- "Rensselaer Polytechnic Institue"
class(RPI)
Rpi <- 3.14159265359
class(Rpi)
isSnowing <- TRUE
class(isSnowing)
R <- 0
class(R)

## Vectors 
num_vec <- c(1,3,5,99) 
class(num_vec)

cha_vec <- c("R","P","I")
class(cha_vec)
boolean_vec <- c(T,FALSE,F) # T = TRUE, you can simply use T for TURE
class(boolean_vec)

# mixed variable types
vec_mixed <- c("RPI", 1824, 3.14)
vec_mixed
class(vec_mixed) #the character class is overrided.
vec_mixed_boolean <- c(TRUE,"RPI", 1824, 3.14)
vec_mixed_boolean
class(vec_mixed_boolean)

vec_numeric_boolean <- c(TRUE,1824,3.14)
vec_numeric_boolean
class(vec_numeric_boolean)
#TRUE and FALSE can be represent with 1 and 0, so the class changes to "numeric".


###Practice2###
days = c('Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun')
temp = c(28, 30.5, 32, 31.2, 29.3, 27.9, 26.4)
#snowed = c('T', 'T', 'F', 'F','T','T','F') #This is a mistake as we cannot convert the boolean to be a number (0 and 1)
snowed = c(TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, FALSE)
class(snowed)
help("data.frame")

#Create data frame
RPI_Weather_Week = data.frame(days, temp, snowed) #data frame function
RPI_Weather_Week
head(RPI_Weather_Week)

str(RPI_Weather_Week)
summary(RPI_Weather_Week)

RPI_Weather_Week[1,]
RPI_Weather_Week[,1]

RPI_Weather_Week[,'snowed']
RPI_Weather_Week[,'days']
RPI_Weather_Week[,'temp']
RPI_Weather_Week[1:5, c("days","temp")]

RPI_Weather_Week$temp
RPI_Weather_Week$days
subset(RPI_Weather_Week,subset = snowed == TRUE)

dec.snow <- order(-RPI_Weather_Week$temp)
dec.snow

#Create an empty dataframe
empty.DataFrame <- data.frame()
v1 <- 1:10
v1

letters
v2 <- letters[1:10]
df <- data.frame(col.name.1=v1, col.name.2=v2)
df

##Practice 3##
temperature <- c(20,24.3,23,24.2,22.5)
names(temperature) <- c("Mon","Tue","Web","Thur","Fri") #attach days to the temperature
temperature

Week_Days <-c("Mon","Tue","Web","Thur","Fri")
names(temperature) <- Week_Days
temperature

# Indexing Vectors 
vec1 <- c('R','P','I')
vec2 <- c(1,8,2,4)
vec1[1]
vec2[2]

# Matrix 
m <- c(1:10) #assign to one row
m
matrix(m,nrow = 2) #assign to two rows
matrix(1:12,byrow = FALSE,nrow = 4) #assign to four rows
matrix(1:12,byrow = TRUE,nrow = 4) #when we set byrow = TRUE, the number will order by row.

# stock prices
goog <- c(560,564,563,562,561)
msft <- c(480,482,484,483,482)
stocks <- c(goog,msft)
stocks
print(stocks)

stock.matrix <- matrix(stocks,byrow = T,nrow = 2)
stock.matrix

days <- c("Mon","Tue","Wed","Thur","Fri")
st.names <- c("goog","msft")
colnames(stock.matrix) <- days
rownames(stock.matrix) <- st.names
print(stock.matrix)

mat <- matrix(1:25,byrow = T, nrow = 5)
mat
mat*2
mat/2
mat^2
1/mat
mat > 15 
mat[mat > 15] #pull the values that are greater than 15
mat + mat 
mat / mat 
colSums(stock.matrix)
rowSums(stock.matrix)
rowMeans(stock.matrix)

# Bind the Columns
FB <- c(223,224,225,223.5,222)
tech.stocks <- rbind(stock.matrix,FB) # Row bind (add another row in the existing data)
tech.stocks
avg <- rowMeans(tech.stocks)
avg
tech.stocks <- cbind(tech.stocks,avg) # Column bind (add another column in the current data)
tech.stocks

mat <- matrix(1:50,byrow = T, nrow = 5)
mat
mat[1,] # first row with all the columns
mat[,1] # first column and all the rows
mat[1:3,] #row 1-3
mat[1:2,1:3] #row 1-2 and columns 1-3
mat[,9:10]
mat[2:3,5:6]

# Factor and Catergorical variables
animals <- c('dog','cat','dog','cat','cat')
id <- c(1,2,3,4,5)
temps <- c('cold','med','hot','hot','hot','cold','med')
temps
fact.temps <- factor(temps, ordered = TRUE, levels = c('cold','med','hot'))
fact.temps
summary(fact.temps)
summary(temps)

undergrads <-c('Freshman','Junior', 'Sophomore','Junior','Senior','Sophomore','Junior','Freshman','Senior','Junior')
undergrads
factor.undergrads <-factor(undergrads,ordered = TRUE,levels = c('Freshman','Sophomore','Junior','Senior'))
factor.undergrads

summary(factor.undergrads) #count each category

# Exercise
A <- c(1,2,3)
B <- c(4,5,6)
A <- rbind(A,B)
A

mat <- matrix(1:9, nrow = 3)
mat
is.matrix(mat)
mat2 <- matrix(1:25, byrow = T, nrow = 5)
mat2
mat2[2:3,2:3]
mat2[4:5,4:5]
sum(mat2)

help("runif")
u <- runif(20)
u
runif(matrix(20))
matrix(runif(20),nrow = 4)

#import data and export data
#write to a csv file
write.csv(df, file='saved_df1.csv')
df2<-read.csv('saved_df1.csv')
df2

##Practice 4##
# Import 2010_EPI_data
install.packages("csv")
library(csv)
data_2010EPI <- read.csv(file.choose(), header = T)
data_2010EPI
str(data_2010EPI)
View(data_2010EPI)
names(data_2010EPI) <- data_2010EPI[1,]
data_2010EPI <- data_2010EPI[-1,]
str(data_2010EPI)
View(data_2010EPI)
head(data_2010EPI)

EPI_data_2010 = as.numeric(data_2010EPI$EPI)
print(EPI_data_2010)
summary(EPI_data_2010)
fivenum(EPI_data_2010)
boxplot(EPI_data_2010)
hist(EPI_data_2010)

rm(list = ls())
# Import EPI_data
#data_EPI <- read.csv(file.choose(), header = T) #header is a column's name.
EPI_data <- read.csv("EPI_Data.csv")
EPI_data
View(EPI_data)
str(EPI_data)
summary(EPI_data)
EPI <- EPI_data$EPI
EPI
boxplot(EPI)
hist(EPI)
fivenum(EPI)
