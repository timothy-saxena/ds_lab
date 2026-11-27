# Question 5: Write/read a CSV, then make a scatter plot and box plot.
measurements <- data.frame(
  id = 1:8,
  study_hours = c(1, 2, 2, 3, 4, 5, 6, 7),
  score = c(42, 48, 55, 58, 67, 73, 81, 88),
  group = c("A", "A", "B", "A", "B", "B", "A", "B")
)

write.csv(measurements, "study_measurements.csv", row.names = FALSE)
data_from_csv <- read.csv("study_measurements.csv")
print(data_from_csv)
write.csv(data_from_csv, "study_measurements_copy.csv", row.names = FALSE)

par(mfrow = c(1, 2))
plot(data_from_csv$study_hours, data_from_csv$score,
     main = "Study Hours vs Score", xlab = "Study hours", ylab = "Score",
     pch = 19, col = "darkgreen")
boxplot(score ~ group, data = data_from_csv,
        main = "Scores by Group", xlab = "Group", ylab = "Score", col = "lightblue")
par(mfrow = c(1, 1))
