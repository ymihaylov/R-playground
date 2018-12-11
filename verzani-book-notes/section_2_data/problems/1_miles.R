# Suppose you keep track of your mileage each time you fill up. 
# At your last 6 fill-ups the mileage was:
miles = c(65311, 65624, 65908, 66219, 66499, 66821, 67145, 67447)

# Differences between every fill up
diffMiles = diff(miles)

max(diffMiles)
mean(diffMiles)
min(diffMiles)

# We can read data from input like this
newData = scan()
