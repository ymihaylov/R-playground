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
# https://stats.stackexchange.com/questions/156778/percentile-vs-quantile-vs-quartile
# https://math.stackexchange.com/questions/398077/question-on-five-number-summary-quantile

fivenum(sals) # Min, Lower Hinge, Median, Upper hinge, Max
summary(sals)

data <- c(1, 2, 3, 4)
fivenum(data) # Min, Lower Hinge, Median, Upper hinge, Max
summary(data)

# Quantile funciton
data = c(10, 17, 18, 25, 28, 28)

quantile(data)
quantile(data, 0.1)
quantile(data, .25)
quantile(data, c(.25, .75))

median(data)
fivenum(data)

# Lower hinge is the median of the left side of the values - 10, 17, 18
# Upper hinge is vice versa - 25, 28, 28
# Theres a big difference between hinges and quantiles

# ----------

sals = sort(c(12, .4, 5, 2, 50, 8, 3, 1, 4, 0.25))
sals
median(sals) # 3.5
fivenum(sals) # note 1 is the 3rd value, 8 the 8th.
summary(sals) # note 3.25 value is 1/4 way between 1 and 2

# Big outlier is 50
mean(sals, trim=1/10) # trim 1/10 off top and bottom
mean(sals, trim=2/10)
mean(sals, trim=1/2)

# The value of mean closer to median
mad(sals) # https://www.statisticshowto.datasciencecentral.com/median-absolute-deviation/
median(abs(sals - median(sals))) # without normalizing constant
median(abs(sals - median(sals))) * 1.4826

# (The choice of 1.4826 makes the value comparable with the standard deviation for the normal distribution.)
?mad

# -------------------
# Stem-and-leaf Charts
scores <- scan() # 2 3 16 23 14 12 4 13 2 0 0 0 6 28 31 14 4 8 2 5
apropos("stem")
stem(da)






