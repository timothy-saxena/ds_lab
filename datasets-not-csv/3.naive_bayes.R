# imported packages
library("e1071")
library("caret")

# data read
data <- read.csv("/Users/timothysaxena/Downloads/MGIT/Sem-V/8. DSL/Mid2/naive bayes/play_tennis.csv",na.strings = "None")
data <- na.omit(data)

#factorizing the categorical column into factors
data$Outlook <- factor(data$Outlook)
data$Temperature <- factor(data$Temperature)
data$Humidity <- factor(data$Humidity)
data$Wind <- factor(data$Wind)
data$Play <- factor(data$Play)

set.seed(23)
num_row <- nrow(data)

training_row_index <- sample(1:num_row,size = floor(0.7 * num_row))
#splitting the data
training_data <- data[training_row_index,]
testing_data <- data[-training_row_index,]
#fitting the model
model <- naiveBayes(Play ~ Outlook+Temperature+Humidity+Wind, data = training_data, laplace = 1)
#predicting values
predicted <- predict(model, newdata = testing_data)
#printing acutal and predicted values(6)
head(data.frame(
  Actual = testing_data$Play,
  Predicted_value = predicted
))

new_day <- data.frame(
  Outlook = "Sunny",
  Temperature = "Cool",
  Humidity = "Normal",
  Wind = "Weak"
)

predict(model, newdata = new_day)
predict(model, newdata = new_day, type = "raw")

cm <- confusionMatrix(
  data = predicted,
  reference = testing_data$Play,
  positive = "Yes"
)

print(cm$table)

accuracy <- cm$overall["Accuracy"]
precision <- cm$byClass["Pos Pred Value"]

print(accuracy)
print(precision)

barplot(cm$table,
        beside = TRUE,
        col = c("red", "blue"),
        legend.text = TRUE,
        main = "Naive Bayes Classification",
        xlab = "Actual class",
        ylab = "Count"
)