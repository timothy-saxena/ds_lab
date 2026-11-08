data <- read.csv("/Users/timothysaxena/Downloads/MGIT/Sem-V/8. DSL/Mid2/linear regression/pizza_sales.csv")
#print 6 rows
head(data)

model <- lm(pizza_sold ~ number_of_ads,data = data)
print(model)
summary(model)

new_data = data.frame(number_of_ads = 25)
predict(model,newdata = new_data)

plot(data$number_of_ads, data$pizza_sold,pch = 19,col = "blue")

abline(model,lwd = 2, col = 'red')