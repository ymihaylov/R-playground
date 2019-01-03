# Histograms
x <- scan()
# 29.6 28.2 19.6 13.7 13.0 7.8 3.4 2.0 1.9 1.0 0.7 0.4 0.4 0.3 
# 0.3 0.3 0.3 0.3 0.2 0.2 0.2 0.1 0.1 0.1 0.1 0.1

length(x[x > 15 & x < 20])

hist(x)
# This is preferred as it relates better to the concept of a probability density.
hist(x, probability = TRUE) 

jitter(x)

# If your data is discrete and has ties, then the rug(jitter(x))
# command will give a little jitter to the x values to eliminate ties.
rug(jitter(x))


?rug
?jitter

# Break points
mean(x)
median(x)
IQR(x)
hist(x)
hist(x, breaks=10) # 10 breaks, or just hist(x, 10)
hist(x, breaks=c(0,1,2,3,4,5,10,20, max(x))) # specify break points

# You need to know that 
# - the median divides the histogram into two equal area pieces
# - the mean would be the point where the histogram would balance if you tried to
# - the IQR captures exactly the middle half of the data.
