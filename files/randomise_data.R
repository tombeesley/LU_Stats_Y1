library(tidyverse)

# Week 2 randomise data

penelope <- read_csv("Week_2/penelope.csv")

count(penelope,identity)

sample(-50:50,94, replace = TRUE) # add a random element

penelope$estimate <- penelope$estimate + sample(-50:50,94)

penelope %>% 
  mutate(fweight = case_when(identity == "Female" ~ estimate),
         oweight = case_when(identity == "Other" ~ estimate)) %>% 
  write_csv("Week_2/penelope.csv")


# Week 6 

data <- read_csv("Week_6/location_music_Wk6.csv")

data <- data[sample(nrow(data)),] # shuffle rows

write_csv(data, "Week_6/location_music_Wk6.csv")


# Week 7 

data <- read_csv("Week_7/data_salary_Wk7.csv")

# add random element to salary estimates

re <- sample(-3:3,205, replace = TRUE) # add a random element

data$uk_salary <- data$uk_salary + re*1000

write_csv(data, "Week_7/data_salary_Wk7.csv")


# Week 8
  
data <- read_csv("Week_8/data_stroop_Wk8.csv")

re <- sample(seq(-.5,.5,.1),606, replace = TRUE) # add a random element

data$stroop_time <- data$stroop_time + re

write_csv(data, "Week_8/data_stroop_Wk8.csv")


# Week 9

data <- read_csv("Week_9/gamble_salary_Wk9.csv")

re <- sample(-3:3,204, replace = TRUE) # add a random element

data$salary_estimate <- data$salary_estimate + re*1000

write_csv(data, "Week_9/gamble_salary_Wk9.csv")
