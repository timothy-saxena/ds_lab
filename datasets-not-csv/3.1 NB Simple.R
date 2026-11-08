library(e1071)
library(caret)

# Read and clean data
data <- read.csv("/Users/timothysaxena/Downloads/MGIT/Sem-V/8. DSL/Mid2/naive bayes/play_tennis.csv",na.strings = "None")

data <- na.omit(data)

# Remove identifier and convert columns to factors
data$Day <- NULL
data[] <- lapply(data, factor)

# Split data
set.seed(23)
i <- sample(1:nrow(data), floor(0.7 * nrow(data)))
train <- data[i, ]
test <- data[-i, ]

# Train and predict
model <- naiveBayes(Play ~ ., data = train, laplace = 1)
predicted <- predict(model, test)

# Evaluate
cm <- confusionMatrix(predicted, test$Play, positive = "Yes")
print(cm$table)
print(cm$overall["Accuracy"])
print(cm$byClass["Pos Pred Value"])

# Predict a new day
new_day <- data.frame(
  Outlook = "Sunny", Temperature = "Cool",
  Humidity = "Normal", Wind = "Weak"
)

predict(model, new_day)
predict(model, new_day, type = "raw")

# Plot
barplot(cm$table, beside = TRUE,
        col = c("red", "blue"), legend.text = TRUE,
        main = "Naive Bayes Classification",
        xlab = "Actual class", ylab = "Count")