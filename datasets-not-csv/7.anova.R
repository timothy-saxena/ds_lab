
# Correlation, Covariance and ANOVA

# Load dataset
data(iris)

# Select numerical variables
numeric_data <- iris[, 1:4]

# 1. Correlation matrix
cor_matrix <- cor(numeric_data)
print("Correlation Matrix")
print(cor_matrix)

# 2. Covariance matrix
cov_matrix <- cov(numeric_data)
print("Covariance Matrix")
print(cov_matrix)

# 3. Correlation plot
install.packages("corrplot")
library(corrplot)

corrplot(cor_matrix,
         method="color",
         type="upper",
         addCoef.col="black",
         main="Iris Correlation Plot")

# 4. ANOVA
model <- aov(Sepal.Length ~ Species,
             data=iris)

print("ANOVA Results")
summary(model)

# 5. Tukey test
TukeyHSD(model)

# 6. Box plot
boxplot(Sepal.Length ~ Species,
        data=iris,
        main="Sepal Length by Species",
        col=c("red", "green", "blue"))
