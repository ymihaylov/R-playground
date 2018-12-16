# За да опишем числовите данни, 
# често искаме да знаем къде се центрира (centered) и какво им е разпределението (spread, размах)

# Suppose, CEO yearly compensations are sampled and the following
# are found (in millions). (This is before being indicted for cooking the books.)
sals = sort(c(12, .4, 5, 2, 50, 8, 3, 1, 4, 0.25))

# Средно аритметично
mean(sals)

# Дисперсия на случайна величина - нейното отклонение от математическото очакване
# Varians - вариране - размах - дисперсия
var(sals)

# Стандартно отклонение - standart deviation
sd(sals)
median(sals)


# https://www.statisticshowto.datasciencecentral.com/upper-hinge-lower-hinge/
fivenum(sals) # min, Lower Hinge, Median, upper hinge, max
summary(sals)

# Quantile funciton
data = c(10, 17, 18, 25, 28, 28)
quantile(data)
quantile(data, 0.25)
quantile(data, .25)
quantile(data, c(.25, .75))

median(data)
# Lower hinge is the median of the left side of the values - 10, 17, 18
# Upper hinge is vice versa - 25, 28, 28
# Theres a big difference between hinges and quantiles

sals = sort(c(12, .4, 5, 2, 50, 8, 3, 1, 4, 0.25))
fivenum(sals) # note 1 is the 3rd value, 8 the 8th.
summary(sals) # note 3.25 value is 1/4 way between 1 and 2
