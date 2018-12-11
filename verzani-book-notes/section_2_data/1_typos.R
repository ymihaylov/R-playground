# There are two syntaxes for assignment
# Count of typos per page
typos = c(2,3,0,3,1,0,0,1)
typos <- c(2,3,0,3,1,0,0,1)

# This prints the value (Only the name)
# [1] means that typo is a vector
typos

# Finds the *mean* of the values
# Средно аритметично
mean(typos)

# Median
# Медиана - Централна средна величина.
# Числото, което е по-средата, ако са пдредени.
# Ако са четен брой, то средно аритметично на средните две
median(typos)
help(var)
# Variance
# Дисперсия
# Oтклонение от математическото очакване
var(typos)

# . is only for punctuation
typos.draft1 = c(2,3,0,3,1,0,0,1)
typos.draft2 = c(0,3,0,3,1,0,0,1)

# Indexes
typos.draft3 = typos.draft2 # make a copy
typos.draft3[1] = 5 # Assign the first page 1
typos.draft3[4] = 5
typos.draft3[-4] # Prints all but 4th page
typos.draft3[c(1, 2, 3)] # Fancy print of 1st, 2nd and 3rd. - slicing

max(typos.draft3) # Prints the worst page, maximum of the vector
typos.draft3 == max(typos.draft3) # Returns other vector with booleans
which(typos.draft3 == max(typos.draft3)) # Returns vector of indexes

n = length(typos.draft3) # Count of elements in vector
pages = 1:n # How we get the pages numbers
pages[typos.draft3 == max(typos.draft3)] # Logical extraction. Very useful

?seq
seq(1, n, 1)

# We can do it with one line, but why?
(1:length(typos.draft2))[typos.draft2 == max(typos.draft2)]

# How many typos?
sum(typos.draft3)
# How many pages with typos?
sum(typos.draft3 > 0)
# Difference between the two?
typos.draft3 - typos.draft2
