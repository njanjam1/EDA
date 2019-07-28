
#Principal component Analysis
#passing mtcars numerical data into prcomp function for prinical component analysis
mtcars.pca <- prcomp(mtcars[,c(1:7,10,11)], center = TRUE,scale. = TRUE)

#vieiwing summary of prcomp function
summary(mtcars.pca)

#Viewing structure of the result
str(mtcars.pca)

#importing and installing libraries for plots
install.packages("devtools")
install.packages("Rcpp")
library("devtools")
install_github("vqv/ggbiplot")
library(ggbiplot)

#plotting the pca result
ggbiplot(mtcars.pca)
#adding rownames to the result
ggbiplot(mtcars.pca, labels=rownames(mtcars))

#Interpretting the results by putting them into 3 categories
mtcars.country <- c(rep("Japan", 3), rep("US",4), rep("Europe", 7),rep("US",3), "Europe", rep("Japan", 3), rep("US",4), rep("Europe", 3), "US", rep("Europe", 3))
ggbiplot(mtcars.pca,ellipse=TRUE,  labels=rownames(mtcars), groups=mtcars.country)

#Use ggbiplot to plot these other component by using the choices argument.
ggbiplot(mtcars.pca,ellipse=TRUE,choices=c(3,4),   labels=rownames(mtcars), groups=mtcars.country)

#adding a circle to the center of the dataset using circle dataset
ggbiplot(mtcars.pca,ellipse=TRUE,circle=TRUE, labels=rownames(mtcars), groups=mtcars.country)

#scaling the samples such as obs.scale and var.scale
ggbiplot(mtcars.pca,ellipse=TRUE,obs.scale = 1, var.scale = 1,  labels=rownames(mtcars), groups=mtcars.country)

#Removing the arrows in the plot using var.axes
ggbiplot(mtcars.pca,ellipse=TRUE,obs.scale = 1, var.scale = 1,var.axes=FALSE,   labels=rownames(mtcars), groups=mtcars.country)


#customizing the ggplot such as specifiying the colors, adding a title, specifying the theme and moving the legend
ggbiplot(mtcars.pca,ellipse=TRUE,obs.scale = 1, var.scale = 1,  labels=rownames(mtcars), groups=mtcars.country) +
scale_colour_manual(name="Origin", values= c("forest green", "red3", "dark blue"))+
ggtitle("PCA of mtcars dataset")+
theme_minimal()+
theme(legend.position = "bottom")

#addng spacecar to mtcars to create a new dataset mtcarsplus
spacecar <- c(1000,60,50,500,0,0.5,2.5,0,1,0,0)
mtcarsplus <- rbind(mtcars, spacecar)
mtcars.countryplus <- c(mtcars.country, "Jupiter")

#performing PCA using prcomp
mtcarsplus.pca <- prcomp(mtcarsplus[,c(1:7,10,11)], center = TRUE,scale. = TRUE)


#customizing the ggplot such as specifiying the colors, adding a title, specifying the theme and moving the legend
ggbiplot(mtcarsplus.pca, obs.scale = 1, var.scale = 1, ellipse = TRUE, circle = FALSE, var.axes=TRUE, labels=c(rownames(mtcars), "spacecar"), groups=mtcars.countryplus)+
  scale_colour_manual(name="Origin", values= c("forest green", "red3", "violet", "dark blue"))+
  ggtitle("PCA of mtcars dataset, with extra sample added")+
  theme_minimal()+
  theme(legend.position = "bottom")

#scaling the values for spacecar in relation to the PCA's center 
s.sc <- scale(t(spacecar[c(1:7,10,11)]), center= mtcars.pca$center)
#applying the rotation of the sample scaled
s.pred <- s.sc %*% mtcars.pca$rotation

#binding the projected values to the rest of the matrix
mtcars.plusproj.pca <- mtcars.pca
mtcars.plusproj.pca$x <- rbind(mtcars.plusproj.pca$x, s.pred)

#customizing the ggplot such as specifiying the colors, adding a title, specifying the theme and moving the legend

ggbiplot(mtcars.plusproj.pca, obs.scale = 1, var.scale = 1, ellipse = TRUE, circle = FALSE, var.axes=TRUE, labels=c(rownames(mtcars), "spacecar"), groups=mtcars.countryplus)+
  scale_colour_manual(name="Origin", values= c("forest green", "red3", "violet", "dark blue"))+
  ggtitle("PCA of mtcars dataset, with extra sample projected")+
  theme_minimal()+
  theme(legend.position = "bottom")