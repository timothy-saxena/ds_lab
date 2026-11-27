# Question 2: Create employee data, inspect it, summarize it, and plot it.
employee <- data.frame(
  id = 1:10,
  name = c("Asha", "Ben", "Charu", "Dev", "Esha", "Farhan", "Gita", "Hari", "Ira", "Jay"),
  department = c("Sales", "IT", "HR", "IT", "Sales", "HR", "IT", "Sales", "HR", "IT"),
  experience_years = c(2, 5, 3, 8, 4, 6, 1, 9, 7, 3),
  salary = c(32000, 52000, 38000, 76000, 45000, 61000, 30000, 82000, 69000, 41000)
)

str(employee)
summary(employee)
plot(employee$experience_years, employee$salary,
     main = "Employee Salary vs Experience",
     xlab = "Experience (years)", ylab = "Salary", pch = 19, col = "steelblue")
