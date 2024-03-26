## ISLR package

data("USArrests")
help("USArrests")

states = row.names(USArrests)
states

names(USArrests)
apply(USArrests, 2, mean)

apply(USArrests, 2, var)

pr.out = prcomp(USArrests, scale=TRUE)
names(pr.out)

pr.out$center
pr.out$scale

pr.out$rotation
dim(pr.out$x)

biplot(pr.out, scale=0)

pr.out$sdev
pr.var = pr.out$sdev
pr.var

pve = pr.var/sum(pr.var)
pve
