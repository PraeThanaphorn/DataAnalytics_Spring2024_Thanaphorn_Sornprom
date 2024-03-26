install.packages('MASS')
data(Boston, package = 'MASS')

help(Boston)

#Compute the principal components
help(prcomp)

pca_out <- prcomp(Boston, scale. = T)
pca_out

#Plotting using the biplot()
help(biplot)

biplot(pca_out, scale = 0)
boston_pc <- pca_out$x
boston_pc

head(boston_pc)
summary(boston_pc)
