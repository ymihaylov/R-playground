# --- Видове данни
# - Категориини - цвят на коса, цват на очи, марка кола
# - Числови - разделят се на дискретни и непрекъснати
#    - Дискретни - годините на хората (20, 25, 30), колко тежиш и т.н.
#    - Непрекъснати - височината на хората - 1.60, 167, 170

# --- Методи за преглеждане на данните
# - Категориини данни
cars <- c('Audi', 'Mercedess', 'BMW', 'VW', 'Audi', 'Audi', 'VW', 'BMW')
table(cars)
prop.table(cars, 1)

# bar graphs
# pie charts

# - Числови данни
summary()
fivenum()

# ----
# Add new elements to vector
v12 = c(v1, v2)
v1other = c(v1, c(1, 2, 3))

# Check type of vector
str(c(1, 2, 'p'))
typeof(c(1, 2, 'p')) # casted all elements to character
typeof(c(1, 2)) # all elements are double

# Convert strings to dates
v3 = as.Date(c("2015-01-01", "2016-07-08"))

# Operations with matrices