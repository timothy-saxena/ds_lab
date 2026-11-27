# Question 4: Student data frame, queries, and three chart types.
students <- data.frame(
  roll_no = 1:10,
  name = c("Aarav", "Bina", "Chirag", "Diya", "Eshan", "Fatima", "Gopal", "Hema", "Ishaan", "Jaya"),
  branch = c("CSE", "ECE", "CSE", "IT", "ECE", "CSE", "IT", "ECE", "CSE", "IT"),
  section = rep(c("A", "B"), 5),
  subjects = c(6, 6, 5, 6, 5, 6, 6, 5, 6, 5),
  cgpa = c(8.2, 7.1, 9.0, 6.8, 7.8, 8.7, 7.4, 8.0, 9.2, 6.9),
  backlogs = c(0, 1, 0, 2, 0, 0, 1, 0, 0, 1)
)

cat("Students with CGPA > 7.5:\n")
print(students[students$cgpa > 7.5, c("roll_no", "name")])
cat("Average CGPA by branch:\n")
print(aggregate(cgpa ~ branch, data = students, FUN = mean))
cat("Top 7 records by CGPA:\n"); print(head(students[order(-students$cgpa), ], 7))
cat("Bottom 7 records by CGPA:\n"); print(head(students[order(students$cgpa), ], 7))

branch_counts <- table(students$branch)
par(mfrow = c(1, 3))
barplot(branch_counts, main = "Students by Branch", xlab = "Branch", ylab = "Count", col = "skyblue")
hist(students$cgpa, main = "CGPA Distribution", xlab = "CGPA", col = "wheat", breaks = 5)
pie(branch_counts, main = "Branch Share", col = c("skyblue", "salmon", "palegreen"))
par(mfrow = c(1, 1))
