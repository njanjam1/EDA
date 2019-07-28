#Creating Matirices and dataframes

x <- 1:5
y <- 6:10
z <- 11:15

# Create a matrix where x, y and z are columns
cbind(x, y, z)

# Create a matrix where x, y and z are rows
rbind(x, y, z)

# Creating a matrix with numeric and character columns will make everything a character:
cbind(c(1, 2, 3, 4, 5),
      c("a", "b", "c", "d", "e"))


# Create a matrix of the integers 1:100,
#  with 10 rows and 12 columns

matrix(data = 1:120,
       nrow = 10,
       ncol = 12)

# Now with 12 rows and 10 columns
matrix(data = 1:120,
       nrow = 12,
       ncol = 10)

# Now with 12 rows and 10 columns, but fill by row instead of columns
matrix(data = 1:120,
       nrow = 12,
       ncol = 10,
       byrow = TRUE)

# Create a dataframe of survey data

survey <- data.frame("index" = c(1, 2, 3, 4, 5),
                     "sex" = c("m", "m", "m", "f", "f"),
                     "age" = c(99, 46, 23, 54, 23))

survey

# structure of the survey dataframe
str(survey)


# Create a dataframe of survey data WITHOUT factors
survey1 <- data.frame("index" = c(1, 2, 3, 4, 5),
                     "sex" = c("m", "m", "m", "f", "f"),
                     "age" = c(99, 46, 23, 54, 23),
                     stringsAsFactors = FALSE)
# structure of the survey1 dataframe
str(survey1)
#factors are missing

# head() shows the first few rows
head(survey)

# tail() shows he last few rows
tail(survey)

# View() opens the entire dataframe in a new window
View(survey)

# Print summary statistics 
summary(survey)

# Print additional information
str(survey)

# names of columns in dataframe
names(ToothGrowth)

# len column of dataframe
ToothGrowth$len

#mean of the len column of ToothGrowth
mean(ToothGrowth$len)


# table of the supp column of ToothGrowth
table(ToothGrowth$supp)

# len AND supp columns of ToothGrowth
head(ToothGrowth[c("len", "supp")])

# Add a new column called sex1 to survey
survey$sex1 <- c("m", "m", "f", "f", "m")

# Change name of 1st column of survey to "a"
names(survey)[4] <- "a"

#Change the column name from age to age.years using logical indexing
names(survey)[names(survey) == "age"] <- "years"


# Return row 1
survey[1, ]

# Return column 4
survey[, 4]

# Rows 1:5 and column 2
survey[1:5, 2]

# rows 1-10 and column 2 of ToothGrowth
ToothGrowth[1:6, 2]

# Rows 1-5 and columns 1 and 3 of ToothGrowth
ToothGrowth[1:5, c(1,3)]


# 10th row (and all columns) of ToothGrowth
ToothGrowth[10, ]

# Create a new df with only the rows of ToothGrowth where supp equals VC
ToothGrowth.VC <- ToothGrowth[ToothGrowth$supp == "VC", ]

# rows of ToothGrowth where len < 20 AND supp == "VC" AND dose >= 5
subset(x = ToothGrowth,
       subset = len < 20 &
         supp == "VC" &
         dose >= 5)

#Create a subsettted dataframe called oj
oj <- subset(x = ToothGrowth,
             subset = supp == "OJ")


mean(oj$len)

survey

#using index for calculation
with(survey, index / years ^ 2)


#vectors

library(tidyverse)

#determine type of data
typeof(letters)
typeof(1:10)

#determine length
x <- list("a", "b", 1:10)

#logical comparison
1:10 %% 3 == 0
length(x)

#Numeric vectors
typeof(1)
typeof(1L)

#squareroot
x <- sqrt(2) ^ 2
x

install.packages("pryr")
library("pryr")
#check object size
x <- "check object size."
pryr::object_size(x)


y <- rep(x, 1000)
pryr::object_size(y)

#Coercion
x <- sample(20, 100, replace = TRUE)
#greater than 10, summary and mean
y <- x > 10
sum(y)
mean(y) 

#checking types
typeof(c(TRUE, 1L))
typeof(c(1L, 1.5))
typeof(c(1.5, "a"))

#scalar functions
sample(10) + 100
runif(10) > 0.5

#using Rep and Tibble functions
tibble(x = 1:4, y = rep(1:2, 2))

#assigning names to vectors
set_names(1:3, c("a", "b", "c"))

#subsetting vectors
x <- c("one", "two", "three", "four", "five")
x[c(3, 2, 5)]
x[c(-1, -3, -5)]

# All non-missing values of x
x[!is.na(x)]
# All even (or missing!) values of x
x[x %% 2 == 0]

#using character subset for named vector
x <- c(abc = 1, def = 2, xyz = 5)

x[c("xyz", "def")]

#recursive vectors
x <- list(1, 2, 3)
x

#multi type list
z <- list(list(1, 2), list(3, 4))

#setting attributes for vectorss
x <- 1:10
attr(x, "greeting")
attr(x, "greeting") <- "Hi!"
attr(x, "farewell") <- "Bye!"
attributes(x)

#generic functions understanding and application
as.Date
methods("as.Date")
getS3method("as.Date", "default")

# Augmented vectors
#factors - designed to represent categorical data
x <- factor(c("ab", "cd", "ab"), levels = c("ab", "cd", "ef"))
typeof(x)
attributes(x)

#Dates in R are numeric vectors that represent the number of days since 1 January 1970.
x <- as.Date("1971-01-01")
x <- lubridate::ymd_hm("1970-01-01 01:00")
unclass(x)

typeof(x)

attributes(x)

#with timezone
attr(x, "tzone") <- "US/Pacific"
x

#Tibbles are augmented lists: they have class "tbl_df" + "tbl" + "data.frame", and names (column) and row.names attributes:
tb <- tibble::tibble(x = 1:5, y = 5:1)
typeof(tb)
attributes(tb)
