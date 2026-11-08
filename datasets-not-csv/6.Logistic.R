# Read data
data <- read.csv("/Users/timothysaxena/Downloads/MGIT/Sem-V/8. DSL/Mid2/logistic regression/admissions.csv")
data$rank <- factor(data$rank)

# Fit logistic regression
model <- glm(admit ~ gre + gpa + rank,
             data = data, family = binomial)

summary(model)

# Predict probabilities and classes
prob <- predict(model, type = "response")
predicted <- ifelse(prob >= 0.5, 1, 0)

# Confusion matrix and training accuracy
print(table(Actual = data$admit, Predicted = predicted))
print(mean(predicted == data$admit))

# Predict admission for a new student
new_student <- data.frame(
  gre = 700, gpa = 3.8, rank = factor(1)
)

p <- predict(model, newdata = new_student, type = "response")
print(p)
print(ifelse(p >= 0.5, 1, 0))

# Plot admission probabilities
plot(prob, pch = 19, col = "blue",
     xlab = "Student", ylab = "Admission probability",
     ylim = c(0, 1))

abline(h = 0.5, col = "red")