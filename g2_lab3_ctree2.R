# Conditional Inference Tree for Mileage
data("cu.summary")
str(cu.summary)
fit2M <- ctree(Mileage~Price + Country + Reliability + Type, data=na.omit(cu.summary))
summary(fit2M)

# plot tree
plot(fit2M, uniform=TRUE, main="CI Tree Tree for Mileage ")


