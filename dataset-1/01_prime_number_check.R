# Question 1: Check whether a given integer is prime.
n <- as.integer(readline("Enter an integer: "))

if (is.na(n)) {
  stop("Please enter a whole number.")
} else if (n < 2) {
  cat(n, "is not prime.\n")
} else {
  divisors <- if (n < 4) integer(0) else 2:floor(sqrt(n))
  is_prime <- length(divisors) == 0 || !any(n %% divisors == 0)
  if (is_prime) cat(n, "is prime.\n") else cat(n, "is not prime.\n")
}
