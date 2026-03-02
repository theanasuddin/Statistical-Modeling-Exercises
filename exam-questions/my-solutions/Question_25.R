df <- read.csv(
  "D:/Tampere University Coursework/Spring semester 2026/Period 3/DATA.STAT.740 Statistical Modeling (5 cr)/Exam Prep/dataset_3342.csv"
)

print(df)
str(df)

# A)
poisson_model1 <- glm(y ~ x_cont, data = df, family = poisson("log"))

# B)
poisson_model2 <- glm(y ~ x_cont + x_cat, data = df, family = poisson("log"))

# C)
AIC <- AIC(poisson_model1, poisson_model2)

print(AIC)

# Choose B (lower AIC)

# D)
new_data <- data.frame(x_cont = 5, x_cat = "B")

predicted <- predict(poisson_model2,
                     newdata = new_data,
                     type = "link",
                     se.fit = TRUE)

predicted_mean <- predicted$fit
predicted_se <- predicted$se.fit

ci_upper_link <- predicted_mean + 1.96 * predicted_se
ci_lower_link <- predicted_mean - 1.96 * predicted_se

ci_upper <- ci_upper_link
ci_lower <- ci_lower_link

print(paste("Expected Count:", exp(predicted_mean)))

print(paste("95% Confidence Interval:", exp(ci_lower), "to", exp(ci_upper)))

# Extension: Effect size interpretation (rate ratios)
coef_table <- summary(poisson_model2)$coefficients
rate_ratios <- exp(coef(poisson_model2))

print("Rate ratios (exp(beta)):")
print(rate_ratios)
