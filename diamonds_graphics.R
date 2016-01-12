#Require the dataset ('diamonds') that we are to use:
require(ggplot2)
data("diamonds")

# To show information on the dataset:
?diamonds
#The information can be seen in the right panel

#We need to ensure all of our data is numerical 
#(i.e. change columns cut, color and clarity). We need a function to do this:

numerical_cut <- function (cut_col) {
  replace(cut_col, cut_col == 'Fair', 1)
  replace(cut_col, cut_col == 'Good', 2)
  replace(cut_col, cut_col == 'Very Good', 3)
  replace(cut_col, cut_col == 'Premium', 4)
  replace(cut_col, cut_col == 'Ideal', 5)
}

numerical_color <- function

numerical_clarity <- function


