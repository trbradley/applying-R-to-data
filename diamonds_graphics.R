#Require the dataset ("diamonds") that we are to use:
install.packages("ggplot2")
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

# Ideally, we want to create a matrix of scatter plots to analyse the data graphically. However,
# there are about 54,000 rows to the table, and so this would take a lot of processing power. This
# is demonstrated by trying to run the following with plot:

plot(diamonds$carat, diamonds$price, pch=16, main="Price vs Carat", xlab="Carat", ylab="Price")

# Alternatively we can use ggplot(which adds an automatic legend and correct axis labels) and add color to represent the diamond's colour:

p <- ggplot()
p + geom_point(data = diamonds, aes(carat, price, color = factor(color)))

#The difference between ggplot and normal plot can particularly be seen with the below bar plots:

counts <- table(diamonds$cut)
barplot(counts, main="Number in different cuts", legend.text = TRUE, 
        args.legend = list(x = "top", bty = "n", inset=c(-0.15, 0)), col=c("red","blue","black","gray","pink"))

#Now with ggplot:

b <- ggplot()
b + geom_bar(data = diamonds, aes(cut, fill = factor(cut)))



