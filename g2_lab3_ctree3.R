# Decision Trees
data("kyphosis")
fitK <- ctree(Kyphosis ~ Age + Number + Start, data=kyphosis)
plot(fitK)
plot(fitK, type="simple")



