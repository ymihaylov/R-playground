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

# ----
x = c(.314,.289,.282,.279,.275,.267,.266,.265,.256,.250,.249,.211,.161)
tmp = hist(x)
tmp$breaks
tmp$mids
?lines
lines(
  c(min(tmp$breaks),tmp$mids,max(tmp$breaks)),
  c(0,tmp$counts,0),
  type="l"
)
lines(density(x))
# This is frequency polygon
# Equivalent is simple.freqpoly.R

# --- Densities
# define this function
data('faithful')
attach(faithful) # make eruptions visible
hist(eruptions, 15, prob=T) # proportions, not frequencies
density(eruptions)
lines(density(eruptions)) # lines makes a curve, default bandwidth
lines(density(eruptions, bw="SJ"), col='red') # Use SJ bandwidth, in red
