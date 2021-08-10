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

# Week 6 create random data

data <- read_csv("Week_6/location_music_Wk6.csv")

# remove conversation skills
data %>% 
  select(-conv_skills) %>% 
  write_csv("Week_6/location_music_Wk6.csv")

swift <- sample(1:5,204, replace = TRUE)
beyonce <- sample(1:5,204, replace = TRUE)
sheeran <- sample(1:5,204, replace = TRUE)

mean(data$music_swift, na.rm = TRUE)
mean(beyonce)
mean(sheeran)

# Week 7 create

data <- read_csv("Week_7/data_salary_Wk7.csv")
  
data <- read_csv("Week_9/gamble_salary_Wk9.csv")
