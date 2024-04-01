#Swiss data
data(swiss)

#k-means
sclass <- kmeans(swiss[2:6], 3) 

#Create the table
table(sclass$cluster, swiss[,1])    
