# Вариация
team1 <- c(72, 73, 76, 76, 78)
team2 <- c(67, 72, 76, 76, 84)
basketball_teams <- data.frame(team1, team2)

# 3. Оценка на вариацията на разпределение

# Преди да започнем с изследването на разсейването, първо ще видим какво е очакването
# Взимаме средните на стойностите по колони
colMeans(basketball_teams)
apply(basketball_teams, 2, mean)    #   Еквивалентно на горния ред


#       Като цяло се избягват заключенията само на база средните стойности или други оценки за 
#   локацията на разпределенията (ще наблегнем на това при оценките на хипотезите). 
#
#       И при двета отбора средните стойности са равни - 75. 
#   Това не означава, че двата отбора са близки относно разпределението на височината им. 
#   В частност, височината при играчите на втория отбор варира много повече от тази на първия. 


#  3.1. Обхват (Range): максималната стойност - минималната стойност
rangeFunction <- function(x) {
  max(x) - min(x)
}

# Както можем да видим от резултатите, при първия отбор имаме разлика от 6 инча, докато при втория - 17
rangeFunction(basketball_teams$team1)
rangeFunction(basketball_teams$team2)

# 3.2. Вариация (дисперсия) и стандартно отклонение
#	За разлика от обхвата, стандартното отклонение взема под внимамнеи всички наблюдения.

#	Стандартното отклонение е оценка на вариацията, 
# която показва колко далече са наблюденията от очакването (от средното).

# Стандартното отклонение е предпочитана оценка за вариацията, 
# когато среднoто се използва за оценка на локацията (центъра) на разпределението.

#	Вариацията (дисперсията) се изчислява по формулата по-долу:
variationFunction <- function(x) {
  x_mean <- mean(x)
  x_minux_xMean <- x - x_mean
  x_minus_xMean_2 <- x_minux_xMean^2
  
  sum(x_minus_xMean_2) / (length(x) - 1)
}

variationFunction(basketball_teams$team1)
var(basketball_teams$team1)
var(basketball_teams$team2)

#   При тестването на хипотези и при определянето на доверителните интервали се използва
#   стандардартното отклонение. Стандартното отклонение е производно на вариацяита и представлява
#   корен квадратен от дисперсията.

sqrt(variationFunction(basketball_teams$team1))
sd(basketball_teams$team1)
sd(basketball_teams$team2)

#       Правилото на Чебишев, което е валидно за всички множества, ни казва, че 89% от наблюденията
#   лежат в интервала (X_mean - 3*X_std; X_mean + 3*X_std), където X_mean - средната стойност и
#   X_std - стандартното отклонение.

#       При камбановидна форма на разпределението, този процент достига до 99.7


N <- 10^4
set.seed(94171)
dist1 <- rnorm(N)
dist2 <- rgamma(N, 3)

# Dist 1
par(mfrow = c(1, 2))
plot(
  density(dist1), 
  lwd = 2,
  main = "Density",
  xlab = "Normal Distribution",
  ylab = "Density",
  col = "lightblue",
  xlim = range(dist1)
)

meanDist1 <- mean(dist1)
sigmaDist1 <- sd(dist1)

abline(
  v = c(meanDist1 - 3*sigmaDist1, meanDist1, meanDist1 + 3*sigmaDist1), 
  col = c("green", "red", "green"),
  lwd = 2
)

# Dist 2
par(mfrow = c(1, 2))
plot(
  density(dist2), 
  lwd = 2,
  main = "Density",
  xlab = "Gamma Distribution",
  ylab = "Density",
  col = "lightblue",
  xlim = range(dist2)
)

meanDist2 <- mean(dist2)
sigmaDist2 <- sd(dist2)

abline(
  v = c(meanDist2 - 3*sigmaDist2, meanDist2, meanDist2 + 3*sigmaDist2), 
  col = c("green", "red", "green"),
  lwd = 2
)

par(mfrow = c(1, 1))

round(sum(dist2 >= meanDist2 - 3*sigmaDist2 & sigmaDist2 <= meanDist2 + 3*sigmaDist2)*100/N, 2)

# -----------
#   3.3. The five number summary
# тази статтистика най-често показва минималната стойност, 1-ви квартил, медиана (2-ри квартил),
# 3-ти квартил и максималната стойност.

summary(dist1)
fivenum(dist1)

par(mfrow = c(1, 2))

plot(
  density(dist1), 
  lwd = 2,
  main = "Density",
  xlab = "Normal Distribution",
  ylab = "Density",
  col = "lightblue",
  xlim = range(dist1)
)

abline(
  v = fivenum(dist1),
  col = c("black", "red", "red", "red", "black"),
  lwd = c(1.5, rep(2, 3), 1.5), 
  lty = c(1, rep(3, 3), 1)
)
summary(dist1)
par(mfrow = c(1, 1))
