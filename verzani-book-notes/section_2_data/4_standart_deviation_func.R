# Yearly number of whales beached in Texas during the period 1990 - 1999
whale = c(74, 122, 235, 111, 292, 111, 211, 133, 156, 79)

mean(whale)

# Variance - Дисперсия
var(whale)

# Standart deviation - Стандартно отклонение
std(whale) # Error
sqrt(var(whale))
sqrt( sum( (whale - mean(whale))^2 / (length(whale) - 1)))

# Create a function for std
std = function (x) sqrt(var(x))
std(whale)

# BUT theres built-in function...
sd(whale)
