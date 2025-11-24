# Extended Linear Model Example for MAE Coursework

set.seed(200)

df <- data.frame(
  id = 1:180,
  training_hours = runif(180, 1, 12),
  experience_years = rnorm(180, 5, 2),
  baseline_score = rnorm(180, 50, 8)
)

# Outcome influenced by training and experience
df$outcome_score <- df$baseline_score +
  1.2 * df$training_hours +
  0.8 * df$experience_years +
  rnorm(180, 0, 4)

# Fit model
model <- lm(outcome_score ~ training_hours + experience_years + baseline_score, data = df)
summary(model)

# Diagnostics
par(mfrow = c(2, 2))
plot(model)
