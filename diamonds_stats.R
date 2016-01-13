#Must run the following setup code: 

#See the 'Further Useful Resources' Section in the README, for details on why each package is used:

install.packages("ggplot2")
require(ggplot2)

install.packages("lmtest")
require(lmtest)

install.packages("sandwich")
require(sandwich)

install.packages("Hmisc")
require(Hmisc)

data("diamonds")

#To get the labels for the different variables:

str(diamonds)

# The purpose of our multiple regression model is to determine what drives 
# the price of diamonds. We store our regression in variable reg1:

reg1 <- lm(price ~ carat + as.numeric(cut) 
           + as.numeric(color) + as.numeric(clarity) + x + y + z + depth + table, data = diamonds)

# Note that for ordinal factor variables (cut, color, clarity) we must use the function as.numeric(),
# this assumes that the numbers associated with each category represent an accurate order.

# For the stats results, run the following:

summary(reg1)

# The high coefficient of determination (Multiple R-squared) and low p-value for the F-statistic (2.2e-16 < 5%)
# both support this model being a strong fit for the data. The coefficient of determination is exceptionally high,
# suggesting that over 90% of price variation is explained by this model. Only z (depth in mm) has a coefficient that is 
# not statistically signification at the 5% level. Before we can use these results, we must test for heteroskedasticity.

# Breusch-Pagan Test for heteroskedasticity:

# Severe heteroskedasticity does not bias the parameter values estimated,
# but it does bias any statistical tests. 

# The test:

bp1 <- bptest(reg1)
bp1

# Our low p-value (2.2e-16) indicates that there is a heteroskedasticity problem.
#We now need robust standard errors.

#The 'sandwich' package provides various options for heteroskedasticity-robust standard errors.
# The 'best' method is a point of debate. Following Long & Ervin (2000) we use the default
# robust standard errors.

reg1$newse <- vcovHC(reg1)
coeftest(reg1,reg1$newse)

# Note: must require lmtest for coeftest to work. It allows the covariance matrix to be specified
# - i.e. allows us to use a robust version (reg2$newse).

# The coeftest() illustrates how the severe heteroskedasticity has not biased parameter values,
# it has instead hindered the validity of any statistical tests. Now both y and z have statistically insignificant 
# coefficients. The other results are robust to the standard errors used. 

# Having adjusted for the likely heteroskedasticity, independent variables y and z will now be removed from the model:

reg2 <- lm(price ~ carat + as.numeric(cut) 
           + as.numeric(color) + as.numeric(clarity) + x + depth + table, data = diamonds)

# There is still heteroskedasticity with y and z removed, as shown below:

bp2 <- bptest(reg2)
bp2

# Thus, we use robust standard errors:

reg2$newse <- vcovHC(reg2)
coeftest(reg2,reg2$newse)

# Multi-collinearity Test

# The rcorr function from Hmisc gives us a correlation matrix for the data.
#Due to our data frame using ordinal factor variables, we use the asNumericMatrix function, also provided by Hmisc,
#to convert them to numeric data. 

rcorr(asNumericMatrix(diamonds))

# The correlation matrix indicates a potential multicollinearity problem because of the high correlation between carat and the various dimensions.
# This is unlikely to affect the model's overall use as a predictor of price but will inflate the standard errors. 
#This could potentially explain why the coefficients of y and z were statistically insignificant.

# We will now rerun our regressions, first with only z removed, then with just y removed.
# The R squared and R squared adjusted will be used to measure fit and select our final model.

reg3 <- lm(price ~ carat + as.numeric(cut) + as.numeric(color) + as.numeric(clarity) + x + y + depth + table, data = diamonds)

# Now we test for heteroskedasticity:

bp3 <- bptest(reg3)
bp3

# We use robust standard errors to correct for this.

reg3$newse <- vcovHC(reg3)
coeftest(reg3,reg3$newse)

# This suggests that, even with the removal of z, y is still not significant.
# The next step is to perform the same procedure with for z with y removed.

reg4 <- lm(price ~ carat + as.numeric(cut) + as.numeric(color) + as.numeric(clarity) + x + z + depth + table, data = diamonds)

bp4 <- bptest(reg4)
bp4

reg4$newse <- vcovHC(reg4)
coeftest(reg4,reg4$newse)

# As as above, this also suggests that z is not significant, even after the removal of y as a variable. Thus we remove y and z 
#from our model, leaving our final model as reg2, seen above.

coeftest(reg2,reg2$newse)

#Interpretation

#Slope Coefficients

#For every unit change in a given variable (holding all other variables included in the model constant), we expect an increase in the US dollar diamond price
#equal to the value of the coefficent. This does not prove causality. For example, there could be variables (excluded from the model),
#related both to the given independent variable and the price. 
#This could result in a statistically significant coefficient value.
#Reverse causality, when changes in price 'causes' changes in the independent variable, is unlikely to be an issue with this dataset.

#Intercept

#The intercept is the expected US dollar diamond price when all of the independent variables are all zero. For our model, this is $5510.26.

#This is not meaningful for the dataset, as it suggests a diamond with zero mass (carat).
