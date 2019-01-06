# --- Problem 3.1
# Enter in the data
# 60 85 72 59 37 75 93 7 98 63 41 90 5 17 97
data = scan();
apropos("stem")

# Make a stem and leaf plot.
stem(data)

# --- Problem 3.2
# Read this stem and leaf plot, enter in the data and make a histogram:
x <- c(80, 82, 88, 91, 91, 95, 95, 97, 98, 101, 106, 106, 109, 110, 111)
hist(x)

# --- Problem 3.3
# One can generate random data with the \r"-commands. 
# For example x = rnorm(100) produces 100 random numbers with a normal distribution. 
# Create two diferent histograms for two diferent
# times of defining x as above. Do you get the same histogram?
x = rnorm(100)
hist(x)

x = rnorm(100)
hist(x)
boxplot(x)
#  as these are 2 distinct generations of rnorm,
#  it goes without saying the their histograms
#  are different...

# --- Problem 3.4
# Make a histogram and boxplot of these data sets from these Simple data sets: south, crime and aid.
# Which of these data sets is skewed? Which has outliers, which is symmetric.
library(UsingR)

# Skewed 
# Has two outliers
data(south)
hist(south)
boxplot(south)

# Skewed
# Has one outliers
data(crime)
hist(crime)
boxplot(crime)

# Symetric
# Has one outliers
data(aid)
hist(aid)
boxplot(aid)

# --- Problem 3.5
# Try to predict the mean, median and
# standard deviation.
data(bumpers)
mean(bumpers)
median(bumpers)
sd(bumpers)

data(firstchi)
mean(firstchi)
median(firstchi)
sd(firstchi)

data(math)
mean(math)
median(math)
sd(math)

# --- Problem 3.6
# Make a table of the possible categories. Try to find the mean.
x = scan()
table(x, useNA='always')

mean(x) # NA

mean(x, na.rm=TRUE)
# OR 
mean(x[!is.na(x)])

# --- Problem 3.7
data("pi2000")
pi2000
hist(pi2000)

table(pi2000)
# Proportion
table(pi2000[pi2000 == 1 | pi2000 == 2 | pi2000 == 3])
table(pi2000)
table(pi2000) / length(pi2000)

# --- Problem 3.8
hist(pi2000, 10, prob=T)
lines(density(pi2000, bw=0.2), col='red')
?density
