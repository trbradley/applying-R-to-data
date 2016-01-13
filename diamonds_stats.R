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

#The high coefficient of determination (Multiple R-squared) and low p-value for the F-statistic (2.2e-16 < 5%)
#both support this model being a strong fit for the data. The coefficient of determination is exceptionally high,
#suggesting that over 90% of price variation is explained by this model. Only z (depth in mm) has a coefficient that is 
#not statistically signification at the 5% level. Before we can use these results, we must test for heteroskedasticity.

#Breusch-Pagan Test for heteroskedasticity:

#Severe heteroskedasticity does not bias the parameter values estimated,
#but it does bias any statistical tests. 

#The following must be downloaded to run the subsequent test:

install.packages("lmtest")
require(lmtest)

#The test:

bp <- bptest(reg1)
bp

#Our low p-value (2.2e-16) indicates that there is a heteroskedasticity problem.
#We now need robust standard errors.

#To implement this, we use a package called 'sandwich':

install.packages("sandwich")
require(sandwich)

#Sandwich provides various options for heteroskedasticity-robust standard errors
#Which is 'best' is point of debate. Following Long & Ervin (2000) we first use the default
#robust standard errors.

reg1$newse<-vcovHC(reg1)
coeftest(reg1,reg1$newse)

#Note: must require lmtest for coeftest to work. It allows the covariance matrix to be specified
# - i.e. allows us to use a robust version (reg2$newse).

#The coeftest() illustrates how the severe heteroskedasticity has not biased parameter values,
#it has instead hindered the validity of any statistical tests. Now both y and z have statistically insignificant 
#coefficients.


