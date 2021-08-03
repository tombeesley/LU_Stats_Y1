library(tidyverse)

penelope <- read_csv("penelope.csv")

mean(penelope$estimate)
sd(penelope$estimate)

median(penelope$estimate)

# Calculate the mean of fweight column

# Calculate the mean of oweight column


hist(penelope$estimate)

boxplot(penelope$estimate)

# create a boxplot of the fweight column


# create a boxplot of oweight column



