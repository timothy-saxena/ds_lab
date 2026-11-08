library(class)
library(caret)

data <- iris

# Split the data
set.seed(23)
i <- sample(1:150, 105)
train <- data[i, ]
test <- data[-i, ]

# KNN classification
predicted <- knn(train[, 1:4], test[, 1:4],
                 train$Species, k = 5)

# Evaluate predictions
cm <- confusionMatrix(predicted, test$Species)
print(cm$table)
print(cm$overall["Accuracy"])
print(cm$byClass[, "Pos Pred Value"])

# Predict a new flower
flower <- data.frame(
  Sepal.Length = 5.1, Sepal.Width = 3.5,
  Petal.Length = 1.4, Petal.Width = 0.2
)

knn(train[, 1:4], flower, train$Species, k = 5)

# Plot
plot(test$Petal.Length, test$Petal.Width,
     col = as.integer(predicted), pch = 19,
     xlab = "Petal length", ylab = "Petal width",
     main = "KNN Classification")

legend("topleft", legend = levels(data$Species),
       col = 1:3, pch = 19)