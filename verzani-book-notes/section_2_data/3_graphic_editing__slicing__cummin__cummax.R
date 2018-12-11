x = c(45,43,46,48,51,46,50,47,46,45)
data.entry(x) # Pops a spreadsheet to edit the data
x = de(x) # Same only, doesnt save changes
x = edit(x) # uses editor to edit x

# The rule is the variable of data should be defined
data.entry(x=c(NA))

# Examples with days
day = 5
# Get the 9th element
x[day + 4]

# Calculates the mean of 5th, 7th, 8th, and 9th days
mean(x[day:day + 4])

# 5, 6, 7, 8, 9 - range
day:(day+4)

# Running maximum - cumulative
cummax(x)

# Running minimum - cumulative
cummin(x)
