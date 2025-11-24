# Data Wrangling Example for MAE Coursework

set.seed(100)

# Simulated dataset
df <- data.frame(
  id = 1:150,
  score_pre = rnorm(150, 40, 8),
  score_post = rnorm(150, 48, 9),
  group = sample(c("Control", "Treatment"), 150, TRUE)
)

library(dplyr)

# Compute change score
df_change <- df %>%
  mutate(
    change = score_post - score_pre
  ) %>%
  group_by(group) %>%
  summarise(
    n = n(),
    mean_change = mean(change),
    sd_change = sd(change)
  )

df_change
