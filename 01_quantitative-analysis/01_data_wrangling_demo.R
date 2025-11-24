# 01_data_wrangling_demo.R
# Simulated MEL dataset: yield and income change by country

set.seed(123)

# Simulate MEL-style dataset: 3 countries, 200 participants
df <- data.frame(
  id = 1:200,
  country = sample(c("CountryA", "CountryB", "CountryC"), 200, TRUE),
  treatment_group = sample(c("Control", "Participant"), 200, TRUE, prob = c(0.4, 0.6)),
  yield_baseline = rnorm(200, 2.5, 0.4),
  yield_endline = rnorm(200, 3.1, 0.5),
  income_baseline = rnorm(200, 500, 100),
  income_endline = rnorm(200, 640, 120)
)

# Inspect the first rows
head(df)

# Load dplyr for wrangling
library(dplyr)

# Create change variables
df_change <- df %>%
  mutate(
    yield_change = yield_endline - yield_baseline,
    income_change = income_endline - income_baseline
  )

# Summary by country
country_summary <- df_change %>%
  group_by(country) %>%
  summarise(
    n = n(),
    mean_yield_baseline = mean(yield_baseline),
    mean_yield_endline = mean(yield_endline),
    mean_yield_change = mean(yield_change),
    mean_income_baseline = mean(income_baseline),
    mean_income_endline = mean(income_endline),
    mean_income_change = mean(income_change)
  )

country_summary

# Summary by treatment vs control
treatment_summary <- df_change %>%
  group_by(treatment_group) %>%
  summarise(
    n = n(),
    mean_yield_change = mean(yield_change),
    mean_income_change = mean(income_change)
  )

treatment_summary
