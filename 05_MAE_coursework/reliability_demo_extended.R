# Extended Reliability Demo for MAE Coursework

set.seed(300)
library(psych)

# Simulated scale with 8 items
items <- data.frame(
  i1 = rnorm(200, 3.2, 0.6),
  i2 = rnorm(200, 3.5, 0.5),
  i3 = rnorm(200, 3.4, 0.7),
  i4 = rnorm(200, 3.3, 0.5),
  i5 = rnorm(200, 3.6, 0.6),
  i6 = rnorm(200, 3.7, 0.4),
  i7 = rnorm(200, 3.1, 0.7),
  i8 = rnorm(200, 3.3, 0.6)
)

alpha(items)

# Item-total correlations
item.total <- item.total(items)
item.total

# Simple factor analysis
fa(items, nfactors = 1)
