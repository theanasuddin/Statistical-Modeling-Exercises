df <- read.csv(
  "D:/Tampere University Coursework/Spring semester 2026/Period 3/DATA.STAT.740 Statistical Modeling (5 cr)/Exam Prep/dataset_7122.csv"
)

print(df)

# A)
logistic_regression_model <- glm(y ~ x1 + x2, data = df, family = binomial("logit"))

summary(logistic_regression_model)
exp(coef(logistic_regression_model))
exp(confint(logistic_regression_model))

# B)
new_data <- data.frame(x1 = 1, x2 = 1)

predicted <- predict(
  logistic_regression_model,
  newdata = new_data,
  type = "link",
  se.fit = TRUE
)

predicted_mean <- predicted$fit
predicted_se <- predicted$se.fit

ci_upper_link <- predicted_mean + 1.96 * predicted_se
ci_lower_link <- predicted_mean - 1.96 * predicted_se

ci_upper <- ci_upper_link
ci_lower <- ci_lower_link

print(paste("Probability of Success:", plogis(predicted_mean)))

print(paste(
  "95% Confidence Interval:",
  plogis(ci_lower),
  "to",
  plogis(ci_upper)
))