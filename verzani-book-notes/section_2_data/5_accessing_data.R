x = c(1, 3, 5, 2, 1, 4, 10, 1)

# How many elements?
length(x)

# ith element
x[2]

# All but ith element
x[-2]

# First k elements
k = 3
x[1:k]

# Last k elements
k = 2
x[(length(x) - k):length(x)]

# Specific elements
x[c(1, 3, 5)]

# All greater than some value
x[x > 3]

# Bigger or less than some values
x[x > 3 & x < 5]
x[x > 3 | x < 5]

# Which - returns index
which(x == max(x))
