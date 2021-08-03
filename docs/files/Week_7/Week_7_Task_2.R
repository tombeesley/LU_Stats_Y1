# Week_7_Task_2
library(tidyverse)
data_phone <- read_csv("data_phone.csv")

data_phone %>%
  ggplot() +
  geom_point() # you will need to edit this code
