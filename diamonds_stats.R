#Must run the following setup code. This involves requiring the dataset ("diamonds") 
#that we are to use:

install.packages("ggplot2")
require(ggplot2)
data("diamonds")

#To get the labels for the different variables:

str(diamonds)

#The purpose of our multiple regression model is to determine what drives 
#the price of diamonds. We store our regression in variable reg1:

reg1 <- lm(price ~ carat + as.numeric(cut) 
           + as.numeric(color) + as.numeric(clarity) + x + y + z + depth + table, data = diamonds)

#Note that for ordinal factor variables (cut, color, clarity) we must use the function as.numeric(),
#this assumes that the numbers associated with each category represent an accurate order.

#For the stats results, run the following:

summary(reg1)

#The high coefficient of determination (Multiple R-squared) and low p-value for the F-statistic (< 5%)
#both support this model being a strong fit for the data. Only z (depth in mm) has a coefficient that is 
#not statistically signification at the 5% level. Thus a new regression is run with z removed:

reg2 <- lm(price ~ carat + as.numeric(cut) 
           + as.numeric(color) + as.numeric(clarity) + x + y + depth + table, data = diamonds)

summary(reg2)

#As we can see, removing z has not had a major impact on the remaining coefficients.


