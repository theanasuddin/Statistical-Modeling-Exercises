# Cheatsheet of the most common commands required to analyse GLMs in base R.

# df <- read.csv("data.csv")

# Fit a normal linear model (with identity link)
# y is the outcome and x1 and x2 are predictors
# Intercept term is included by default in the model
# model <- glm(y ~ x1 + x2, data = df, family = gaussian)

# Add modified variables to the dataset, e.g. normalized x1
# Alternative 1:
# df$new_variable <- (df$x1 - mean(df$x1)) / sd(df$x1)
# Alternative :2:
# df$new_variable_2 <- scale(df$x1)

# Fit a Gamma-regression model with inverse link
# y is the outcome and x1, x2 and x3 are predictors, and x2:x3 
# is the interaction between x2 and x3
# model <- glm(y ~ x1 + x2:x3, data = df, family = Gamma("log"))

# y is the outcome and x1, x2 are predictors
# Including x1 * x2 as a predictors 
# includes x1, x2 and the interaction between x1 and x2
# is the interaction between x2 and x2
# model <- glm(y ~ x1 * x2, data = df, family = Gamma("log"))

# Fit a logistic regression model (y is a binary outcome)
# model <- glm(y ~ x1 + x2, data = df, family = binomial("logit"))

# Fit a binomial regression model
# (y is a count of successes and n is the total number of trials)
# model <- glm(cbind(y, n - y) ~ x1 + x2, data = df, family = binomial("logit"))

# Fit a Poisson regression model (y is a count outcome)
# model <- glm(y ~ x1 + x2, data = df, family = poisson("log"))

# Summary of the model
# summary(model)

# Coefficients and their standard errors
# coef(model)

# Confidence intervals for the coefficients
# confint(model)

# predict-function (evaluate the model at the observed data): 
# type = "response" — Predictions on the outcome scale
# predicted_values <- predict(model, type = "response")

# predict-function (evaluate the model at the observed data): 
# type = "link" — Predictions at the new_data on the linear predictor scale
# predicted_link_values <- predict(model, type = "link")

# Predicted values for new data, includes standard errors of the predictions
# new_data <- data.frame(x1 = c(1, 2), x2 = c(3, 4))

# predict-function: 
# type = "response" — Predictions on the outcome scale
#        includes standard errors of the predictions 
# predicted_new_values <- predict(model,
#                                 newdata = new_data,
#                                 type = "response",
#                                 se.fit = TRUE)

# predict-function: 
# type = "link" — Predictions at the new_data on the linear predictor scale
#        includes standard errors of the predictions 
# predicted_new_link_values <- predict(model,
#                                      newdata = new_data,
#                                      type = "link",
#                                      se.fit = TRUE)

# Find the confidence interval for the predicted values
# ci_upper <- predicted_new_link_values$fit + 1.96 * predicted_new_link_values$se.fit
# ci_lower <- predicted_new_link_values$fit - 1.96 * predicted_new_link_values$se.fit

# Akaike Information Criterion (AIC) for model comparison
# AIC(model1)
# AIC(model1, model2)

# Plotting the data
# plot(x1, y, pch = 16, xlab = "x1, ylab = "y")



