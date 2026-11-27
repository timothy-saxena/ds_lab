# Question 16: Create and transform a 15-student score data frame.
students <- data.frame(
  id = 1:15,
  name = c("Asha", "Bilal", "Charu", "Deep", "Esha", "Farid", "Gita", "Hari", "Isha", "Jay", "Kiran", "Lata", "Mohan", "Nina", "Om"),
  score = c(78, 55, 91, 63, 39, 84, 72, 48, 96, 60, 67, 33, 88, 74, 51)
)
str(students)
summary(students)

cat("Rows with score > 60 (name and score only):\n")
print(students[students$score > 60, c("name", "score")])
students$grade <- ifelse(students$score >= 40, "Pass", "Fail")
students <- students[order(-students$score), ]
cat("Sorted scores with grade:\n"); print(students)

# rbind needs matching column names and compatible column types.
new_row <- data.frame(id = 16, name = "Pooja", score = 69, grade = "Pass")
students <- rbind(students, new_row)
# cbind needs the same number and order of rows.
students$section <- rep(c("A", "B", "C"), length.out = nrow(students))
other_students <- data.frame(id = 101:103, name = c("Q", "R", "S"), score = c(70, 80, 90), grade = c("Pass", "Pass", "Pass"), section = c("A", "B", "C"))
combined_rows <- rbind(students, other_students)
extra_column <- data.frame(attendance = rep(95, nrow(students)))
students_with_attendance <- cbind(students, extra_column)
cat("After adding a row:\n"); print(tail(students, 2))
cat("After adding a column:\n"); print(head(students_with_attendance))
cat("Combined data frames with rbind:\n"); print(tail(combined_rows, 3))
