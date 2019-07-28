setwd( "C:/Users/janja/Desktop/HarrisBurg/Semester 2/506 - Exploratory Data Analytics/Code Portfolio")
library(readr)

# To load CSV file
ozone <- read_csv("US EPA data 2017.csv")
View(ozone)

#rewrite the names of the columns to remove any spaces.
names(ozone) <- make.names(names(ozone))

# To check the number of rows
nrow(ozone)
# To check the number of columns
ncol(ozone)

# To check the data structures using str() function
str(ozone)

# start and end of dataset head() and tail() function
head(ozone)
tail(ozone)

#selected data viewing
head(ozone[, c(6:7, 10)])
tail(ozone[, c(6:7, 10)])

#variable to see what time measurements 
table(ozone$`State.Code`)
library(dplyr)

#saving files as datframes or displaying using filter function
filter(ozone, State.Code == "36" 
        & County.Code == "033" 
       & Site.Num == "10") %>%
        select( State.Code, County.Code, 
                Site.Num) %>% 
        as.data.frame

#counting and viewing unique data
select(ozone, State.Name) %>% unique %>% nrow
unique(ozone$State.Name)

#Sumarizing data
summary(ozone$Observation.Percent)

#additional breakdown
quantile(ozone$Observation.Percent, seq(0, 1, 0.1))


# Ranking the state with highest value
ranking <- group_by(ozone, State.Name, County.Name) %>%
  summarise(ozone = mean(Observation.Percent)) %>%
  as.data.frame %>%
  arrange(desc(ozone))
ranking

#seeing top 10
head(ranking, 10)

#bottom 10
tail(ranking, 10)

#checking number of observations
filter(ozone, State.Name == "California" & County.Name == "Mariposa") %>% nrow

ozone <- mutate(ozone, Date.Local = as.Date(X1st.Max.DateTime))

#splitting at hourly levels
filter(ozone, State.Name == "California" & County.Name == "Mariposa") %>%
           mutate(month = factor(months(X1st.Max.DateTime), levels = month.name)) %>%
           group_by(month) %>%
           summarize(ozone = mean(Sample.Duration))