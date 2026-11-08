# 1. Read the dataset
data <- read.csv("/Users/timothysaxena/Downloads/MGIT/Sem-V/8. DSL/Mid2/kmeans/Mall_Customers.csv")

# 2. Select the numerical features
x <- data[, c("AnnualIncome", "SpendingScore")]

# 3. Perform K-means clustering
set.seed(132)

km <- kmeans(x, centers = 5, nstart = 25)

# 4. Display results
head(km$cluster, 10)
round(km$centers, 2)
km$size

# 5. Plot the clusters
plot(x$AnnualIncome, x$SpendingScore,
     col = km$cluster,
     pch = 19,
     xlab = "Annual income (dataset units)",
     ylab = "Spending score",
     main = "K-Means Customer Clustering")

# 6. Add centroids and labels
points(km$centers,
       pch = 8,
       cex = 2,
       lwd = 2)

text(km$centers,
     labels = paste("Cluster", 1:5),
     pos = 3,
     cex = 0.85)

# 7. Create a new customer
new_customer <- c(
  AnnualIncome = 70,
  SpendingScore = 80
)

# 8. Calculate distance to each centroid
distances <- apply(km$centers, 1, function(center) {
  sqrt(sum((new_customer - center)^2))
})

round(distances, 2)

# 9. Select the nearest cluster
predicted_cluster <- which.min(distances)
print(predicted_cluster)

# 10. Add the new customer to the graph
points(new_customer[1], new_customer[2],
       pch = 17,
       cex = 2,
       col = predicted_cluster)

text(new_customer[1], new_customer[2],
     labels = "New customer",
     pos = 1,
     cex = 0.85)