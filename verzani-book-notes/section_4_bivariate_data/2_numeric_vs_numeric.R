# Categorical vs numerical

x <- c(5, 5, 5, 13, 7, 11, 11, 9, 8, 9)
y <- c(11, 8, 4, 5, 9, 5, 10, 5, 4, 10)
boxplot(x, y)
# we see that the y variable seems to be less than that of the x variable

# ---
amount <- scan()
# 5 5 5 13 7 11 11 9 8 9 11 8 4 5 9 5 10 5 4 10

category <- scan()
# 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2

boxplot(amount)
boxplot(amount ~ category)
# Read the part amount ~ category as breaking up the values in amount
# by the categories in category and displaying each one.
# Verbally, you might read this as \amount by category".

# ----
# Bivariate data: numerical vs. numerical

# Side by side boxplots with rug
# By using the rug command we can see all the data. It works best with smallish
# data sets (otherwise use the jitter command to break ties).
data(home)
attach(home)
names(home)
boxplot(scale(old))
boxplot(scale(new))
boxplot(data.frame(scale(home))) 

# Using stripcharts or dotplots
plot(scale(old), scale(new), col = c('red', 'green'))
?plot

# Comparing shapes of distributions
simple.violinplot(scale(old),scale(new))

# ----
# Using scatterplots to compare relationships
?home
plot(old, new, col = c('red', 'green'))

# ---
# R Basics: What does attaching do?
old <- c(5)
old
attach(home)
old

ls() # list all variables
x = 1:2
y = c(2,4)
df = data.frame(x=x, y=y)
rm(y)
attach(df)
ls(pos=2)

# It is important to remember to detach the dataset
