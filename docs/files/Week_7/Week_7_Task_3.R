library(tidyverse)
data <- read_csv("data_salary.csv")

# are our estimates different from actual UK median salary?
t.test(x = data$uk_salary, mu = 29600)

data_UK <- data %>%
  filter(home_location == "UK")


data %>%
  ggplot() +
  geom_boxplot(aes(y = uk_salary, fill = home_location), colour = "purple", size = 2) +
  scale_fill_manual(values = c("yellow", "black", "orange")) +
  theme_classic(base_size = 16) +
  theme(legend.key.size = unit(3,"line"))


walking_speed <- tibble(prime = rep(c("old", "neutral"),5),
                        time = round(runif(10,7,14),0))


