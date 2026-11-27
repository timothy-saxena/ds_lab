# Question 11: Factor levels/frequencies, type checks/conversion, and IQR.
grades <- factor(c("A", "B", "A", "C", "B", "A", "D", "B", "C", "A"),
                 levels = c("A", "B", "C", "D"), ordered = TRUE)
cat("Levels:\n"); print(levels(grades))
cat("Number of levels:", nlevels(grades), "\n")
cat("Factor structure:\n"); str(grades)
grade_counts <- table(grades)
cat("Students in each grade:\n"); print(grade_counts)
cat("Grade with the most students:\n"); print(names(grade_counts)[grade_counts == max(grade_counts)])

score_text <- c("72", "85", "91", "68", "77")
scores <- as.numeric(score_text)
cat("Type checks:\n")
print(is.character(score_text)); print(is.numeric(scores)); print(class(grades))
cat("Converted scores:\n"); print(scores)
cat("Score IQR:", IQR(scores), "\n")
