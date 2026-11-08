# Read data and select two numerical columns
data <- read.csv("/Users/timothysaxena/Downloads/MGIT/Sem-V/8. DSL/Mid2/kmeans/Mall_Customers.csv")
x <- data[, c("AnnualIncome", "SpendingScore")]

# Create five clusters
set.seed(132)
km <- kmeans(x, centers = 5, nstart = 25)

print(km$centers)
print(km$size)

# Plot customers and centroids
plot(x, col = km$cluster, pch = 19)
points(km$centers, pch = 8, cex = 2)

# New customer: income = 70, spending score = 80
distance <- sqrt((km$centers[, 1] - 70)^2 +
                   (km$centers[, 2] - 80)^2)

# Display distance to each cluster centre
print(data.frame(
  Cluster = 1:5,
  Distance = round(distance, 2)
), row.names = FALSE)

# Choose the nearest cluster
cat("Predicted cluster:", which.min(distance), "\n")