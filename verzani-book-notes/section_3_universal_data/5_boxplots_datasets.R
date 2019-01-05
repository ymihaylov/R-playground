# Boxplot are based on fivenumber summary
install.packages("UsingR")
library(UsingR)
simple.lm()
data(movies)
names(movies)
attach(movies)
?attach # to access the names above - variables in global space

movies$current
boxplot(current, main="current receipts", horizontal=TRUE)
boxplot(gross, main="gross receipts", horizontal=TRUE)
detach(movies)

install.packages("UsingR")
library("UsingR")
simple.lm()
data("lynx") # Read in dataset
summary(lynx)

library() # Lists all available packages
data() # Lists data of all available datasets
data(package='ts')  # Load the data from this dataset
lynx
