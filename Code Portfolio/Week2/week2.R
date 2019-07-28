# To display all the objects
ls()
#  remove objects c and d from the workspace
a <- c(3)
d <- c(4)
rm(a, b)
# rm is used tp remove objects

# TO remove all object in the workspace

## rm(list = ls()) # all objects in the environment is removed

# Important - once you remove an object, you cannot get it back without running the code

# To get current working directory

getwd() 

#C:/Users/janja/Desktop/HarrisBurg/Semester 2/506 - Exploratory Data Analytics/Code Portfolio"#"C:/Users/janja/Desktop/HarrisBurg/Semester 2/506 - Exploratory Data Analytics/Code Portfolio"



setwd( "C:/Users/janja/Desktop/HarrisBurg/Semester 2/506 - Exploratory Data Analytics/Code Portfolio")
# To change the working directory 
# To return the names of files in WD

list.files() 
# returned "week2.R"



# Save objects a, d to Test.RData

save(a, d, file = "Test.RData") # saves the all objects in a single file called myobjects.RData

# Example
Team.df <- data.frame(id= 2:6,
                       sex = c("f","f","f","m","m"),
                       score = c(9, 7, 5, 2, 1))

score.by.sex <- aggregate(score ~ sex,
                          FUN = mean,
                          data = Team1.df)

Team.htest <- t.test(score ~ sex,
                      data = Team1.df)
#saving above two objects as a new .RData file
save(Team.df, score.by.sex, Team.htest, 
     file = "Tab1.RData")
# Saved in working directory 

#To save all the objects in workspace use save.image () function
save.image(file = "image.RData")

# image.RData contains all objects in current WD

# To load objects in the file

load(file = "image.RData")

# Export data use .txt Use write.table() function 

mtcars

write.table(x = mtcars, 
            file = "mtcars.txt",  # save file as mtcars.txt
            sep = "\t")         # make the columns tab-delimeted

# To read text file read.table() function

Team2 <- read.table(file = "Tab1.RData", sep = '\t', header = TRUE, stringsAsFactors = FALSE ) 
# file is tab-delimited , first row is a header row,  do NOT convert strings to factors
# R searches Working Directory(WD) 
# reading files form a web read.table() function

Fromweb <- read.table(file = 'http://goo.gl/jTNf6P',
                      sep = '\t',
                      header = TRUE)
Fromweb 

# To read non-text file like Stata,SAS and SPSS use package foreign
# To read Excel files use package xlsx
# It's easy to convert files into simple text first and reading into R with read.table() function

install.packages("foreign")
install.packages("xlsx")

