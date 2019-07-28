#using Tidyerse library and its tables
library(tidyverse)
table1
table2
table3
table4
table5

# Compute rate per 10,000 using mutate function
table1 %>% 
  mutate(rate = cases / population * 10000)

# Compute cases per year using count functions
table1 %>% 
  count(year, wt = cases)

#use gather to get columns into a new pair of variables called Key and Value
table4a %>% 
  gather(`1999`, `2000`, key = "year", value = "cases")
table4b %>% 
  gather(`1999`, `2000`, key = "year", value = "population")


#use left join to get the data into a single tibble
tidy4a <- table4a %>% 
  gather(`1999`, `2000`, key = "year", value = "cases")
tidy4b <- table4b %>% 
  gather(`1999`, `2000`, key = "year", value = "population")
left_join(tidy4a, tidy4b)

#spread is usded observation is scattered across multiple rows
table2 %>%
  spread(key = type, value = count)

#separate() pulls apart one column into multiple columns, by splitting wherever a separator character appears.
#separating rate into cases and population
table3 %>% 
  separate(rate, into = c("cases", "population"))
#separating rate into cases and population using seperator
table3 %>% 
  separate(rate, into = c("cases", "population"), sep = "/")
#separating rate into cases and population selecting auto convert for types
table3 %>% 
  separate(rate, into = c("cases", "population"), convert = TRUE)

#separating rate into cases and population splitting last 2 digits of a year
table3 %>% 
  separate(year, into = c("century", "year"), sep = 2)

#Unite - combines multiple columns into a single column with seperator
table5 %>% 
  unite(new, century, year, sep = "")


stocks <- tibble(
  year   = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  qtr    = c(   1,    2,    3,    4,    2,    3,    4),
  return = c(1.88, 0.59, 0.35,   NA, 0.92, 0.17, 2.66)
)

#implicit missing value explicit
stocks %>% 
  spread(year, return)

#set na.rm = TRUE in gather() to turn explicit missing values implicit
stocks %>% 
  spread(year, return) %>% 
  gather(year, return, `2015`:`2016`, na.rm = TRUE)

#use complete to make missing values explicit in tidy data
stocks %>% 

  #use fill for missing data filling  
stocks %>% 
  fill(return)
  complete(year, qtr)


  
  
  gather(year, return, `2015`:`2016`, na.rm = TRUE)