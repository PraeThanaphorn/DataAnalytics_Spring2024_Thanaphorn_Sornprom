#Inclass_2-23-2024

#Outlier Examples
#car dataset

cars
str(cars)
dim(cars)
cars1 <- cars[1:30,] #Take first 30 rows 
head(cars1)

#create manual outliers
cars_outliers <- data.frame(speed=c(19,19,20,20,21), dist=c(190,186,210,220,218))
head(cars_outliers)
cars2 <- rbind(cars1, cars_outliers)
help(par) #Query Graphical Parameters

par(mfrow=c(1,2))
plot(cars$speed, cars$dist, xlim=c(0,28), ylim = c(0,230), main="With Outliers", xlab = "speed", ylab = "dist",
     pch="*", col="red", cex=2)
abline(lm(dist ~ speed, data = cars2, col = "blue", lwd = 3, Ity=2))

#Plot of orginal data without outliers
plot(cars1$speed, cars1$dist, xlim=c(0,28), ylim = c(0,230), main = "Outliers removed",
     xlab = "speed", ylab = "dist", pch = "*", col="red", cex=2)
abline(lm(dist~speed, data=cars1), col="blue", lwd=3, Ity=2)
