# 02_descriptive_visualization.R
# Basic visualizations for MEL-style reporting

set.seed(123)

df <- data.frame(
  id = 1:200,
  country = sample(c("CountryA", "CountryB", "CountryC"), 200, TRUE),
  treatment_group = sample(c("Control", "Participant"), 200, TRUE, prob = c(0.4, 0.6)),
  yield_baseline = rnorm(200, 2.5, 0.4),
  yield_endline = rnorm(200, 3.1, 0.5)
)

df$yield_change <- df$yield_endline - df$yield_baseline

library(dplyr)
library(ggplot2)

# Average yield change by country
country_summary <- df %>%
  group_by(country) %>%
  summarise(mean_yield_change = mean(yield_change))

# Bar plot: average yield change by country
ggplot(country_summary, aes(x = country, y = mean_yield_change)) +
  geom_col() +
  labs(
    title = "Average Yield Change by Country (Simulated)",
    x = "Country",
    y = "Average Change in Yield"
  ) +
  theme_minimal()

# Boxplot: yield change by treatment group
ggplot(df, aes(x = treatment_group, y = yield_change)) +
  geom_boxplot() +
  labs(
    title = "Yield Change by Treatment Group (Simulated)",
    x = "Group",
    y = "Change in Yield"
  ) +
  theme_minimal()
