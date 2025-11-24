# 04_linear_models_example.R
# Linear model: training hours and yield (simulated)

set.seed(321)

df <- data.frame(
  id = 1:120,
  training_hours = runif(120, 2, 12),
  baseline_yield = rnorm(120, 2.4, 0.4)
)

# Assume yield_endline depends on baseline and training
df$yield_endline <- df$baseline_yield +
  0.1 * df$training_hours + rnorm(120, 0, 0.3)

df$yield_change <- df$yield_endline - df$baseline_yield

# Fit linear model
model <- lm(yield_change ~ training_hours, data = df)
summary(model)

# Simple visualization
plot(
  df$training_hours, df$yield_change,
  xlab = "Training hours",
  ylab = "Change in yield",
  main = "Training Hours and Yield Change (Simulated)"
)
abline(model, col = "red", lwd = 2)
