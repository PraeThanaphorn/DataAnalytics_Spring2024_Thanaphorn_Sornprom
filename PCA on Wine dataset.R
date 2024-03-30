##PCA Wine dataset
wine_data <- read.csv("wine.csv")
str(wine_data)
View(wine_data)

head(wine_data)
help("cor")
nrow(wine_data)

colnames(wine_data) <- c("Cvs", "Alcohol", 
                         "Malic_Acid", "Ash", "Alkalinity_of_Ash", 
                         "Magnesium", "Total_Phenols", "Flavanoids", "NonFlavanoid_Phenols",
                         "Proanthocyanins", "Color_Intensity", "Hue", "OD280/OD315_of_Diluted_Wine", 
                         "Proline")
head(wine_data) # Now you can see the header names.

# Using the Heatmap() function, we can check the correlations,
# In the heatmap(), the "Dark Colors" represent the "Correlated"
# In the heatmap(), the "Light Colors" represent the "Not or less Correlated"
help("heatmap") # Read the heatmap() function Documentation in RStudio.
# Now we will use the heatmap() function to show the correlation among variables.
heatmap(cor(wine_data),Rowv = NA, Colv = NA)

help(factor)
# declaring the cultivar_classes using the 
cultivar_classes <- factor(wine_data$Cvs) 
cultivar_classes

help("prcomp")
wine_data_PCA <- prcomp(scale(wine_data[,-1]))
summary(wine_data_PCA)

