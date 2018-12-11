# Suppose you track your commute times for two weeks (10 days) 
# and you and the following times in minutes
commutes = c(17, 16, 20, 24, 22, 15, 21, 15, 17, 22)
max(commutes)
mean(commutes)
min(commutes)

# Oops, the 24 was a mistake. It should have been 18. How can you fix this?
# First solution
commutes[which(commutes == 24)] = 18
commutes[commutes == 24] = 18
commutes
# Second solution
commutes = edit(commutes)

# Third solution
data.entry(commutes)

mean(commutes)

# How many times was your commute 20 minutes or more?
length(commutes[commutes >= 20]) # 4 times
# OR
sum(commutes >= 20)

# What percent of your commutes are less than 17 minutes?
commutes_under_17_mins = sum(commutes < 17)
total_commutes = length(commutes)
percent_under_17_mins = (sum(commutes < 17) / length(commutes)) * 100
