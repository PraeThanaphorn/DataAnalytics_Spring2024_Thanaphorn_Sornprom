# Conditional Inference Tree for Mileage
cu.summary
str(cu.summary)
View(cu.summary)

fit2M <- ctree(Mileage~Price + Country + Reliability + Type, data=na.omit(cu.summary))
summary(fit2M)
# plot tree
plot(fit2M, uniform=TRUE, main="CI Tree for Mileage ")
text(fit2M, use.n=TRUE, all=TRUE, cex=.8)

fit3M <- ctree(Mileage~Price, data=na.omit(cu.summary))
summary(fit3M)
plot(fit3M, uniform=TRUE, main="CI Tree for Mileage ")
text(fit3M, use.n=TRUE, all=TRUE, cex=.8)

fit4M <- ctree(Mileage~Type, data = na.omit(cu.summary))
summary(fit4M)
plot(fit4M, uniform=TRUE, main="CI Tree for Mileage")
text(fit4M, use.n=TRUE, all=TRUE, cex=.8)

fit5M <- ctree(Mileage~Reliability, data = na.omit(cu.summary))
summary(fit5M)
plot(fit5M, uniform=TRUE, main="CI Tree for Mileage")
text(fit5M, use.n=TRUE, all=TRUE, cex=.8)
