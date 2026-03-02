df <- read.csv(
  "D:/Tampere University Coursework/Spring semester 2026/Period 3/DATA.STAT.740 Statistical Modeling (5 cr)/Exam Prep/dataset_2065.csv"
)

print(df)
str(df)

# A)
model <- lm(y ~ x1 * x2, data = df)

summary(model)

# B)

# Extract coefficients
b <- coef(model)

# Difference between group B and A at x1 = -1
diff_x1_neg1 <- b["x2B"] + b["x1:x2B"] * (-1)

# Difference between group B and A at x1 = 1
diff_x1_pos1 <- b["x2B"] + b["x1:x2B"] * (1)

diff_x1_neg1
diff_x1_pos1
