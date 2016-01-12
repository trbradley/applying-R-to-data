#Require the dataset ('diamonds') that we are to use:
require(ggplot2)
data("diamonds")

str(diamonds)

View(diamonds)

# To show information on the dataset:
?diamonds
#The information can be seen in the right panel

#Some of the data appears non-numerical, and so the following appears to be
#required: diamonds$cut <- replace(diamonds$cut, diamonds$cut == Fair, 1).
#However, if we run str(diamonds), we can see that, in reality, these non-numerical 
#values are ordered factors, which already have associated numerical values, and so a 
#transformation is not required.

#Graphical Analysis

#Ideally, we want to create a matrix of scatter plots to analyse the data graphically. However,
#there are about 54,000 rows to the table, and so this would take a lot of processing power. This
#is demonstrated by trying to run the following:

plot(diamonds$carat, diamonds$price, pch=16, main='Price vs Carat', xlab='Carat', ylab='Price')







