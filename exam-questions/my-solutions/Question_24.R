df <- read.table(
  "D:/Tampere University Coursework/Spring semester 2026/Period 3/DATA.STAT.740 Statistical Modeling (5 cr)/Exam Prep/nambeware.txt",
  sep = "\t",
  dec = ".",
  header = TRUE
)

print(df)

# A)
model1 <- glm(Diam ~ Time + Price, data = df, family = gaussian)

model2 <- glm(Diam ~ Time + Price,
              data = df,
              family = gaussian(link = "log"))

model3 <- glm(I(1 / Diam) ~ Time + Price, data = df, family = gaussian)

model4 <- glm(log(Diam) ~ log(Time) + log(Price),
              data = df,
              family = gaussian(link = "log"))

AIC <- AIC(model1, model2, model3, model4)

print(AIC)

# Choose model with lowest AIC

# B)
gamma_model <- glm(Diam ~ log(Time) + log(Price),
                   data = df,
                   family = Gamma("log"))

new_data <- data.frame(Time = log(20), Price = log(100))

predicted <- predict(gamma_model,
                     newdata = new_data,
                     type = "response",
                     se.fit = TRUE)

predicted_mean <- predicted$fit
predicted_se <- predicted$se.fit

ci_upper_link <- predicted_mean + 1.96 * predicted_se
ci_lower_link <- predicted_mean - 1.96 * predicted_se

ci_upper <- ci_upper_link
ci_lower <- ci_lower_link

print(paste("Predicted Mean:", exp(predicted_mean)))

print(paste("95% Confidence Interval:", exp(ci_lower), "to", exp(ci_upper)))
