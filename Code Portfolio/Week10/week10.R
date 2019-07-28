
#Kmeans algorithm
#simulating some data from three clusters
#setting the seed
set.seed(1234)
#creating df x and y with random values
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)
#plotting a graph for x and y
plot(x, y, col = "blue", pch = 19, cex = 2)
#setting x and y coordinates
text(x + 0.05, y + 0.05, labels = as.character(1:12))

#creating data frame from x and y generated earlier
dataFrame <- data.frame(x, y)
#using kmeans to implement K means algorithm 
kmeansObj <- kmeans(dataFrame, centers = 3)
#diplaying names in the object
names(kmeansObj)

#knowing cluster each data point got assigned using cluster
kmeansObj$cluster

#building heatmap
set.seed(1234)
#buildin a dataframe
dataMatrix <- as.matrix(dataFrame)[sample(1:12), ]
#implementing a kmeans solution
kmeansObj <- kmeans(dataMatrix, centers = 3)

#developing a image plot using the datamatrix and the kmeans object clusters
par(mfrow = c(1, 2))
image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt = "n", main = "Original Data")
image(t(dataMatrix)[, order(kmeansObj$cluster)], yaxt = "n", main = "Clustered Data")

# data manipulation
library(tidyverse) 
# clustering algorithms
library(cluster)    
# clustering algorithms & visualization
install.packages("factoextra")
library(factoextra) 

df <- USArrests

#remove any missing value
df <- na.omit(df)

#standardize the data using scale
df <- scale(df)

#use get_dist for computing a distance matrix between the rows of a data matrix
#use fviz_dist for visualizing a distance matrix
distance <- get_dist(df)
fviz_dist(distance, gradient = list(low = "#00AFBB", mid = "white", high = "#FC4E07"))
head(df)

#implementing kmeans algorithm using kmeans
k2 <- kmeans(df, centers = 2, nstart = 25)
str(k2)

#viewing cluster plot
fviz_cluster(k2, data = df)

#using standard pairwise scatter plots to illustrate the clusters
df %>%
  as_tibble() %>%
  mutate(cluster = k2$cluster,
         state = row.names(USArrests)) %>%
  ggplot(aes(UrbanPop, Murder, color = factor(cluster), label = state)) +
  geom_text()

#developing mulitple kmean solutionss
k3 <- kmeans(df, centers = 3, nstart = 25)
k4 <- kmeans(df, centers = 4, nstart = 25)
k5 <- kmeans(df, centers = 5, nstart = 25)

# plots to compare
p1 <- fviz_cluster(k2, geom = "point", data = df) + ggtitle("k = 2")
p2 <- fviz_cluster(k3, geom = "point",  data = df) + ggtitle("k = 3")
p3 <- fviz_cluster(k4, geom = "point",  data = df) + ggtitle("k = 4")
p4 <- fviz_cluster(k5, geom = "point",  data = df) + ggtitle("k = 5")

library(gridExtra)
grid.arrange(p1, p2, p3, p4, nrow = 2)



# Dissimilarity matrix
d <- dist(df, method = "euclidean")

# Hierarchical clustering using Complete Linkage
hc1 <- hclust(d, method = "complete" )

# Plot the obtained dendrogram
plot(hc1, cex = 0.6, hang = -1)

# Compute with agnes
hc2 <- agnes(df, method = "complete")

# Agglomerative coefficient
hc2$ac

# methods to assess
m <- c( "average", "single", "complete", "ward")
names(m) <- c( "average", "single", "complete", "ward")

# function to compute coefficient
ac <- function(x) {
  agnes(df, method = x)$ac
}

map_dbl(m, ac)


# compute divisive hierarchical clustering
hc4 <- diana(df)

# Divise coefficient; amount of clustering structure found
hc4$dc

# plot dendrogram
pltree(hc4, cex = 0.6, hang = -1, main = "Dendrogram of diana")


# use cutree to cut agnes() tree into 4 groups
hc_a <- agnes(df, method = "ward")
cutree(as.hclust(hc_a), k = 4)

# use cutree to Cut diana() tree into 4 groups
hc_d <- diana(df)
cutree(as.hclust(hc_d), k = 4)

#Determining Optimal Clusters

#Elbow Method
fviz_nbclust(df, FUN = hcut, method = "wss")

#Average Silhouette Method
fviz_nbclust(df, FUN = hcut, method = "silhouette")

#Gap static method
gap_stat <- clusGap(df, FUN = hcut, nstart = 25, K.max = 10, B = 50)
fviz_gap_stat(gap_stat)