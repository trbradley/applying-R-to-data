# Applying R To A Dataset

Using R to analyse data through multiple regression analysis and graphical analysis, using the 'diamonds' dataset provided by ggplot2. This consists of the prices and characteristics of approximately 54000 individual diamonds.

## Authors

* Andrew Burnie
* Thomas Bradley

## Installation

For this program to work, download R from [The R Project](https://www.r-project.org/), followed by [RStudio](https://www.rstudio.com/). Further usage instructions for each file follow below.

Download this repository using either git clone or by unpacking the zip into it's own folder.

## Purpose Of Each File

*diamonds_graphics.R*

* Demonstrates how to create scatter plots and bar plots in R. Additionally, the differences between the      default plot functions and the abilities of the R package, ggplot2, are demonstrated.

*diamonds_stats.R*

* Uses R to apply multiple regression analysis to a cross-sectional database.
  

## Using This Repository

1. Open the file of interest in RStudio.
2. Run the setup code at the beginning of the file.
3. Read through the file to find code of interest.
4. Select this block of code and click Run to see the output.

##Further Useful Resources 

A major strength of R is the variety of packages available. The below were used:

* Documentation for [ggplot2](https://cran.r-project.org/web/packages/ggplot2/ggplot2.pdf), which has more useful default graphical preferences and an easier syntax than the default package. It also provides the 'diamonds' dataset. See the website for more details: [ggplot2.org](http://ggplot2.org).
* Documentation for [lmtest](https://cran.r-project.org/web/packages/lmtest/lmtest.pdf), which provides diagnostic tests for linear regression, e.g. heteroskedasticity testing. 
* Documentation for [sandwich](https://cran.r-project.org/web/packages/sandwich/sandwich.pdf), which provides a variety of robust standard error types.
* Documentation for [Hmisc](https://cran.r-project.org/web/packages/Hmisc/Hmisc.pdf), which provides a useful function to produce a matrix of correlation coefficients.

Note that these packages must first be installed, e.g. `install.packages("sandwich")`, and then required, e.g. `require("sandwich")` in order to be used.

##References

Long J. S., Ervin L. H. (2000), Using Heteroscedasticity Consistent Standard Errors in the Linear
Regression Model. The American Statistician, 54, 217–224.

Drew Dimmery provides a useful guide on how to implement 
robust standard errors [here](http://drewdimmery.com/robust-ses-in-r/).