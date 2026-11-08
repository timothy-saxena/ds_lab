# 1. Load packages and dataset
library(class)
library(caret)

data <- iris
head(data)

# 2. Split into 70% training and #30% testing
set.seed(23)

train_index <- sample(
  1:nrow(data),
  size = floor(0.70 * nrow(data))
)

train_data <- data[train_index, ]
test_data <- data[-train_index, ]

# 3. Predict test classes using the four measurement columns
predicted <- knn(
  train = train_data[, 1:4],
  test = test_data[, 1:4],
  cl = train_data$Species,
  k = 5
)

# 4. Confusion matrix
cm <- confusionMatrix(
  data = predicted,
  reference = test_data$Species
)

print(cm$table)

# 5. Accuracy and precision for each species
print(cm$overall["Accuracy"])
print(cm$byClass[, "Pos Pred Value"])

# 6. Create a new flower
new_flower <- data.frame(
  Sepal.Length = 5.1,
  Sepal.Width = 3.5,
  Petal.Length = 1.4,
  Petal.Width = 0.2
)

# 7. Predict the new flower's species
knn(
  train = train_data[, 1:4],
  test = new_flower,
  cl = train_data$Species,
  k = 5
)

# 8. Plot test flowers using predicted species colours
plot(test_data$Petal.Length, test_data$Petal.Width,
     col = as.integer(predicted),
     pch = 19,
     xlab = "Petal length",
     ylab = "Petal width",
     main = "KNN Classification")

legend("topleft",
       legend = levels(data$Species),
       col = 1:3,
       pch = 19)