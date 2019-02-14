# Zad 2 ot snimka - razpredelenia
# Razpredelnieto e binomno 
?rbinom

# Zad 2 group 2
X ~ Hg(52, 52/4, 10)
x = rhyper(100, 52, 13, 10)

P (2 <= X <= 6) = P(X<=6) - P(X <= 1) = phyper(6, 52, 13, 10) - phyper(1, 52, 13, 10)
rbinom(100, 50, 1/6)
# Намираме наблюдения между 2 и 6
x[x >2 & x < 6]
?pbinom
# poslednoto
P(X=6) = dhyper(6, 52, 13, 10)

# Koi razpredelenia
# - Ravnomerno, normalno, binomno, geometrichno, hyper geometrichno, poasonovo, otricatelno binomno


# Zadacha doveritelnen interval
# Zadacha 3 Snimka
# S hipotezi ne s doveritelni intervali
t.test(100, alternative = "less")

# Tipove doveritelni intervali
# Hipotezi - edna ili dve izvadki - proporcii
# - Gledame kakwo e razpr (shapriro)- ako e normalno - t.test i z.test 
# AKo ne znaem che e nromalno - medianata - srywnqwame s konsultata 
# z test t test paired

# 3 zad - group 1 - plyhove
t.test(rat, 100, alternative = "less", conf.level = 0.97)

# 3 zad 
# two types of rat
t.test(rat1, rat2, alternative = "less", paired = TRUE)

# p-value = 0.28 > alpha = 0.05 => accept H0

# zad 4 линейна регресия
# intercept 
# Koi parametri mojem da izkliuchim
# *** sa snachimi parametri

# Зад 5
# - Koi sa znachimi parametri
# Znachimi koeficienti - intercept
# Ako izklucihm koeficienta full - modela shte stane po-dobur
# 2, 2, 1
# Price = -140.31
# Price = -140.31 + 14.44 * 2 + 40.48 * 2 + 90.40 * 1
# Kakva bi ibla cenata ako imame kushta sus 2 full, ...

# lm i summary - drugia variant

5
summary(a)

# Uslovna veroyatnost
P(x = 1 , Y = 2)
prop.table(table(x, y), 2)











