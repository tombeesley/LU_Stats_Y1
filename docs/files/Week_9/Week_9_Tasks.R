library(tidyverse)
library(effectsize)
library(pwr)

data_gs <- read_csv("gamble_salary.csv")

# Q3 - Use boxplot to look for outliers
data_gs %>%
  ggplot(aes(x = gamble_gain, y = salary_estimate)) +
  geom_boxplot()

# Q4 and Q5 - create a new column with mutate and arrange the data
data_gs <-
  data_gs %>%
  mutate(z_score = scale(salary_estimate)) %>%
  arrange(desc(z_score))

# Q6 - check if there are outliers in the high salary estimates
data_gs %>%
  filter(z_score > 2)

# Q6 - check if there are outliers in the low salary estimates
data_gs %>%
  filter(z_score < -2)

# Q7 - use a filter to remove the outliers
data_gs_OR <-
  data_gs %>%
  filter(z_score < 2 & z_score > -2) # use this to remove the outliers

# Q8 - compute the mean salary estimate and N for each condition of the gamble variable
data_gs_OR %>%
  group_by(gamble_gain) %>%
  summarise(salary = mean(salary_estimate),
            N = n())

# Q9 - run a t-test on the two groups of participants (risk-seeking vs. risk_averse)
t.test(data = data_gs_OR,
       salary_estimate ~ gamble_gain,
       var.equal = TRUE,
       paired = FALSE)

# Q11 - caculate the effect size
cohens_d(data = data_gs, salary_estimate ~ gamble_gain)

# Q12 - with a power of .8, what effect size could this experiment hope to observe?
pwr.t.test(power = .8, d = .24)




