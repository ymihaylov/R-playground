x <- c(45,43,46,48,51,46,50,47,46,45)
length(x)
mean(x)
median(x)
max(x)
min(x)

# Append values to x
x <- c(x,48,49,51,50,49)
length(x)

# Add to a specific index
# The gap is NA
x[16] = 5

# Add to many specific indexes
x[17:20] = c(40,38,35,40)
# From 21 to 24 every value is 1
x[21:24] = c(1)
x
