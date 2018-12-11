x = c(1,3,5,7,9)
y = c(2,3,5,7,11,13)

x + 1 # Adds 1 to every element
y * 2 # Multiply every element element by 2

length(x) # 5
length(y) # 6
x + y # Error. It will try to add every element from x with every element from y, but the lengths are not equals
sum(x > 5) # 2 TRUE + TRUE
sum(x[x>5]) # 16
sum(x > 5 | x < 3) # 3
y[3] # 5
y[-3] # All but third
y[x] # NA
y[y>=7] # 7 11 13


