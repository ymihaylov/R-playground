# Suppose, a group of 25 people are surveyed as to their beer-drinking preference.
# The categories were (1) Domestic can, (2) Domestic bottle, (3) Microbrew and (4) import.
beer = c(3, 4, 1, 1, 3, 4, 3, 3, 1, 3, 2, 1, 2, 1, 2, 3, 2, 3, 1, 1, 1, 1, 4, 3, 1)

# Barplot data
barplot(beer) # this isn't correct - graph all the values
barplot(table(beer)) # summerized data
barplot(table(beer)/length(beer)) # divide by n for proportion???
table(beer)
table(beer) / length(beer)

# Help for functions
?scan
####

beer.counts = table(beer) # store the table result
pie(beer.counts) # kind of dull

# Give names
names(beer.counts) = c("Domestic\n can", "Domestic\n bottle", "Microbrew", "Import")
pie(beer.counts)
pie(beer.counts, col=c("purple", "green2", "cyan", "white")) # now with colors
?pie
