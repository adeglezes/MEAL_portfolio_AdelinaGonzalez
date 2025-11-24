# 03_reliability_validity_demo.R
# Reliability and simple validity checks for a short scale

set.seed(42)
library(psych)

# Simulated 6-item scale (e.g., confidence in applying practices)
items <- data.frame(
  item1 = rnorm(150, 3.5, .7),
  item2 = rnorm(150, 3.7, .6),
  item3 = rnorm(150, 3.6, .7),
  item4 = rnorm(150, 3.4, .8),
  item5 = rnorm(150, 3.5, .6),
  item6 = rnorm(150, 3.8, .7)
)

# Cronbach's alpha for internal consistency
alpha_result <- alpha(items)
alpha_result

# Simple one-factor exploratory factor analysis
fa_result <- fa(items, nfactors = 1)
fa_result

# Compute total score and correlate with a simulated outcome
items$total_score <- rowSums(items)
outcome <- 0.5 * scale(items$total_score) + rnorm(150, 0, 0.5)

# Correlation as a basic validity signal
cor(items$total_score, outcome)
