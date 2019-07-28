#using nycflights and tidyverse
library(nycflights13)
library(tidyverse)

#using filter to filter data
filter(flights, month == 1, day == 1)

#saving result to variable
(dec25 <- filter(flights, month == 12, day == 25))

#comparisons
#using OR for all flights that departed in November or December
filter(flights, month == 11 | month == 12)

#using IN to select every row where month is one of the values in 11,12
nov_dec <- filter(flights, month %in% c(11, 12))

# using NOT for flights that weren't delayed (on arrival or departure) by more than two hours
filter(flights, !(arr_delay > 120 | dep_delay > 120))

x <- NA
y <- NA
# Cannot compare NA
x == y

#checking for NA
is.na(x)

#using arrange to sort data
arrange(flights, year, month, day)

#selecting the order of sort
arrange(flights, desc(year))

#renaming tail_num to tailnnum
rename(flights, tail_num = tailnum)

#moving time_hour to start of the dataframe using everything
select(flights, time_hour,  everything())

# Select columns by name
select(flights, year, month, day)

# selects column name with a in flight data set
select(flights, starts_with("a"))

# Select all columns between year and day 
select(flights, year:day)

# Select all columns except those from year to day 
select(flights, -(year:day))

# containing certain letters in word
select(flights, starts_with("fl")) 


# mutate() to create new variables a end of dataset
flights_sml <- select(flights, 
                      year:day, 
                      ends_with("delay"), 
                      distance, 
                      air_time
)
mutate(flights_sml,
       gain = dep_delay - arr_delay,
       speed = distance / air_time * 60
)

# use transmute()  to keep the new variables 
transmute(flights,
          gain = dep_delay - arr_delay,
          hours = air_time / 60,
          gain_per_hour = gain / hours
)

#use summarise() to collapse a data frame to a single row
summarise(flights, delay = mean(dep_delay, na.rm = TRUE))

#combining multiple operations using the pipe 
delays <- flights %>% 
  group_by(dest) %>% 
  summarise(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>% 
  filter(count > 20, dest != "HNL")


