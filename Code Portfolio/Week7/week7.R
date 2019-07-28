#using tidyverse as it contains
library(tidyverse)

#Creating a ggplot using ggplot
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

#turning code into reusable template
ggplot(data = <DATA>) + 
  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

#mapping the colors of points to the class variable to reveal the class of each car
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

#mapping class to size
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))


#map class to the alpha aesthetic to controls the transparency of the points
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

#map class to the alpha aesthetic to controls the shape of the points
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

#using facet_wrap() to facet the plot by a single variable - class  
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

#using facet_wrap() to facet the plot by a 2 variable
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

#geom is the geometrical object that a plot uses to represent data
# using point geom
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# using smooth geom
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

#hiding the legend using show.legend as false
ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )

#display multiple geoms in the same plot
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

#using bar geom
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

#Override the default mapping from transformed variables. display a bar chart of proportion
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))

#using stat_summary() to summarise the y values for each unique x value
ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  ))

#coloring bar charts using colors
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))

#stacking bars automatically using clarity
ggplot(data = diamonds) + 

#using identity to know the exact position of each object    
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
geom_bar(fill = NA, position = "identity")

#using dodge to place overlapping objects directly beside one another.
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")


#flipping x and y using coord_flip
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()

