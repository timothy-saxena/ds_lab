# Question 17: Numeric vectors, coercion, filtering, and sequence helpers.
x <- seq(2, 20, by = 2)
cat("x:"); print(x)
cat("Elements at positions 3 to 6:"); print(x[3:6])

# c(1, "a", TRUE) becomes character because character is the highest type here.
coerced <- c(1, "a", TRUE)
cat("c(1, \"a\", TRUE):\n"); print(coerced)
cat("Type:", typeof(coerced), "\n")

v <- c(5, 12, 8, 21, 3)
above_7 <- v[v > 7]
cat("Values greater than 7:"); print(above_7)
cat("Their mean:", mean(above_7), "\n")

target <- c(rev(seq(2, 10, by = 2)), rep(2, 3))
cat("Target vector:"); print(target)
