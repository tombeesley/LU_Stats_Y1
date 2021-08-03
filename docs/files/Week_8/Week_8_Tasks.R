library(tidyverse)
data <- read_csv("data_stroop.csv")

view(data)

# TASK 2 - REPLACE ALL "MISSING" PARTS

data %>%
  group_by(stroop_condition) %>%
  summarise(stroop_mean = mean(stroop_time),
            stroop_se = sd(stroop_time)/sqrt(n())) %>%
  ggplot(aes(x = stroop_condition,
             colour = stroop_condition,
             y = stroop_mean)) +
  geom_col(size = 2) +
  geom_errorbar(aes(ymin = stroop_mean - stroop_se,
                    ymax = stroop_mean + stroop_se),
                width = .2) +
  labs(x = "List type",
       y = "Time to read list (seconds)",
       title = "Data from the stroop experiment") +
  scale_colour_manual(values = c("darkgreen", "darkblue", "darkred")) +
  theme_classic()


# TASK 3 - paired t-tests

# filter is used to select two levels of the IV
stroop_comparison <-
  data %>%
  filter(stroop_condition == "compatible" | stroop_condition == "incompatible")

# run the t-test comparing the means of these two levels
t.test(data = stroop_comparison, stroop_time ~ stroop_condition, paired = TRUE)




