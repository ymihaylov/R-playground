# Задача 1
# - Писане на функция

##### - Сума на три числа
sum_three = function (a, b, c) {
  a + b + c
# or  return (a + b + c)
}

sum_three(1, 2, 3)

##### - Функция на мода
numbers <- c(1, 2, 3, 4, 5, 6, 7, 7)
modeFunction <- function(x) {
  tt <- table(x)
  print(names(tt))
  return (names(tt)[tt == max(tt)])
}
modeFunction(numbers)


##### - Функция за медиана - проверка за четно и нечетно
medianFunction <- function(x) {
  x_sorted <- sort(x)
  length_of_x <- length(x_sorted)
  
  if (length_of_x %% 2 == 0) {
    x_sorted[length_of_x/2 + c(0, 1)]
    return (mean(x_sorted[length_of_x/2 + c(0, 1)]))
  } else {
    print(round(length_of_x/2 + 0.25))
    return (x_sorted[round(length_of_x/2 + 0.25)])
  }
}

medianFunction(c(1, 2, 3))

#### - Variation function
variationFunction <- function(x) {
  x_mean <- mean(x)
  x_minux_xMean <- x - x_mean
  x_minus_xMean_2 <- x_minux_xMean^2
  
  sum(x_minus_xMean_2) / (length(x) - 1)
}

##### - Цикъл for - задача

##### - Корелация

x = c(1, 2, 3, 4, 5)
which(x > 3)
sum(x > 4)
?binom


sum = function (n) {
  x = 1:5
}

sum(5)

x=1:5


