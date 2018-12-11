# Your cell phone bill varies from month to month. 
# Suppose your year has the following monthly amounts

# Enter this data into a variable.
phone_bills = c(46, 33, 39, 37, 46, 30, 48, 32, 49, 35, 30, 48)

# Use the sum command to find the amount you spent this year on
# the cell phone.
sum(phone_bills)

# What is the smallest amount you spent in a month?
min(phone_bills)

# What is the largest?
max(phone_bills)

# How many months was the amount greater than $40?
count_bills_greter_than_40 = length(phone_bills[phone_bills > 40])
count_bills_greter_than_40 = length(which(phone_bills > 40))

# What percentage was this?
count_bills_greter_than_40 / length(phone_bills) * 100
