# ---------
# Задача 4
# Тестове
# ttest - мерим средната стойност
# Ho: p = p (шапка ^)
# Хипотези
# proptest - пропорции - имаме вектор
# proptest(x, p=0.4)
# p-value < 0.05 - отхвърляме хипотезата

# Върнати кредити 10
# Общо 40
# p = 0.5
x <- c(0,1,0,0, 1, 1)
proptest(x, p=0.5)
proptest(x, p=0.5, alternative=1)
?prop.test
# Задача за pi квадрат
# ttest
# wildcox.test
# t.test
# Шапиро
# shapirotest(x) - връща pi value
# Ako > 0.05 => wild.test
# Ako > 0.05
# Hox x
# Ho x = x шапка
# H1 x != x шапка
t.test(x, alternative)

# Сръвняваме локациите на x и y
# shapirotest(x)
# Ако дете pvalue > 0 0.5 - p тест
# witxox.test

x = c(1, 2, 3, 4, 5,6,7,9)
y = c(2, 2, 3, 4, 5)
shapiro.test(x)
shapiro.test(y)

wilsox.test(x, y) => p = 0.01

# По линия или не по линията тест
