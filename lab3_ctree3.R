kyphosis
str(kyphosis)
View(kyphosis)

fitK <- ctree(Kyphosis ~ Age + Number + Start, data=kyphosis)
summary(fitK)
plot(fitK, main="Conditional Inference Tree for Kyphosis")

plot(fitK, main="Conditional Inference Tree for Kyphosis",type="simple")

fitK1 <- ctree(Kyphosis ~ Age, data = kyphosis)
plot(fitK1)

fitK2 <- ctree(Kyphosis ~ Age + Number, data = kyphosis)
plot(fitK2)
