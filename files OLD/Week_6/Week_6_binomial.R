library(tidyverse)

# how many events
e <- 94

# alpha rate
# for 10%, set to 0.05 (two-tailed)
# for 5%, set to 0.025 (two-tailed)
# for 1%, set to 0.005 (two-tailed)
# for 0.1%, set to 0.0025 (two-tailed)
a <- 0.025

# what are the binomial probabilities of X events
# out of e, with a probability of 0.5
bin_probs = dbinom(0:e, e, .5)

# plot of probability of different results
ggplot() +
  geom_col(aes(x = 0:e, y = bin_probs)) +
  scale_x_continuous(breaks = seq(0,e,5)) +
  labs(title = str_c("Binomial probabilities for a sample of ", e),
       subtitle = "Red line shows criterion for determining significance",
       y = "Probability of result under null hyp.",
       x = str_c("Number of positive results out of ", e)) +
  geom_hline(yintercept = a,
             colour = "red",
             size = 1.5) +
  #geom_label(aes(x = 0:e, y = -.005, label = round(bin_probs,3)),
            #colour = "blue") +
  theme_classic(base_size = 16)


