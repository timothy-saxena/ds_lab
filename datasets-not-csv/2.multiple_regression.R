data = read.csv("/Users/timothysaxena/Downloads/MGIT/Sem-V/8. DSL/Mid2/multiple regression/house_price.csv")
head(data)

model <- lm(House_Price ~ Square_Footage+Num_Bedrooms+Num_Bathrooms, data = data)
model
summary(model)

new_house <- data.frame(Square_Footage=1500,	Num_Bedrooms=2,	Num_Bathrooms=3)
predict(model,newdata = new_house)

predicted_prices <- predict(model,newdata = data)

plot(data$House_Price, predicted_prices,
     main = "Multiple Regression: House prices Acutal vs Predicted",
      xlab = "Actual House Price",
      ylab = "Predicted House Price",
     pch = 19,
     col = "lightblue"
)

abline(a =0, b = 1, lwd = 2, col = "red")