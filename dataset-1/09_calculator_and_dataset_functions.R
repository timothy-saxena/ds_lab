# Question 9: Calculator operations and common dataset functions.
calculator <- function() {
  
  repeat {
    
    num1 <- as.numeric(readline("Enter first number: "))
    num2 <- as.numeric(readline("Enter second number: "))
    
    cat("\n1. Addition")
    cat("\n2. Subtraction")
    cat("\n3. Multiplication")
    cat("\n4. Division")
    cat("\n5. Exit\n")
    
    choice <- as.integer(readline("Enter your choice: "))
    
    result <- switch(choice,
                     num1 + num2,
                     num1 - num2,
                     num1 * num2,
                     num1 / num2,
                     "exit")
    
    if (choice == 5) {
      cat("Calculator exited.\n")
      break
    }
    
    cat("Result =", result, "\n\n")
  }
}

calculator()

data(iris)
str(iris)
summary(iris)
iris_subset <- subset(iris, Species == "setosa", select = c(Sepal.Length, Sepal.Width, Species))
print(head(iris_subset))
print(aggregate(Sepal.Length ~ Species, data = iris, FUN = mean))
plot(iris$Sepal.Length, iris$Petal.Length,
     main = "Iris Sepal vs Petal Length", xlab = "Sepal length", ylab = "Petal length",
     col = iris$Species, pch = 19)
legend("topleft", legend = levels(iris$Species), col = 1:3, pch = 19)
