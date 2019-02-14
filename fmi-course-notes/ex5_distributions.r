#   Разпределения

############################
#       Преди да започнем с характеристиките на разпределенията трябва да знаем, че в R
#   всяко разпределение има разновидност, която стартите с d-(име на разпределение),
#   p-(име на разпределение), q-(име на разпределение) и r-(име на разпределение). Тези
#   означения показват какво искаме да правим:
#       r- - генериране на случайни величини за разпределението
#       d- - изчислява вероятността за сбъдване на събитието x
#       p- - изчислява вероятността на предварително зададен квантил за разпределението
#       q- - изчислява квантилът на предварително зададена вероятност за разпределението

#   p- е обратна функция на q-. Например qnorm(pnorm(0.9)) = 0.9, pnorm(qnorm(0.9)) = 0.9
############################
pnorm(0.9)
#   1. Равномерно дискретно разпределение (РДР)
#       РДР е вероятностно разпределение, което може да приема краен n на брой стойности,
#   за които вероятността за настъпване е една и съща, тоест равна на 1/n.
#       В R, няма точна функция за РДР както за другите разпределения. Функцията sample
#   решава проблема частично.
#       Така, че ще се наложи сами да си напишем сами функциите за генериране, плътност,
#   CDF и изчисляване на квантилите

rdud <- function(n, a, b) {
  sample(x = c(a:b), size = n, replace = TRUE)
}

ddud <- function(x, a, b) {
  if (x >= a & x <= b & round(x) == x) {
    return(1/(b - a + 1))
  } else {
    return(0)
  }
}

pdud <- function(q, a, b) {
  if(q < a) {
    return(0)
  } else if(q <= b) {
    return(floor(q)/(b - a + 1))
  } else {
    return(1)
  }
}

qdud <- function(p, a, b) {
  floor(a + p*(b - a))
}

set.seed(71278)
dud <- rdud(n = 10, a = 1, b = 4)
dud
#   параметърът "replace" позволява на sample() да извършва избор на елемент с
#   връщание. Ако не е TRUE и размерът на желаната извадка е по-голям от големината
#   на "x", то функцията ще даде грешка.

#   Ако го представим графично, то разпределението изглежда така:
barplot(table(dud))
prop.table(table(dud))

#   С увеличаване на броя на наблюденията, вероятнсотите се изравняват.
set.seed(15927)
dud <- rdud(n = 10000, a = 1, b = 4)
prop.table(table(dud))
barplot(table(dud))
barplot(prop.table(table(dud)))

#       Средната стойност и медианата са равни на (a + b)/2, къдетo "а" и "b" са
#   минималанта и максималната стойности.
#       Вариацията е равна на ((b - a + 1)^2 - 1)/12
summary(dud)
var(dud)

#   2. Биномно разпределение
#       Биномното разпределение е дисктретно разпределение, което брои успехите в редица
#   от n независими опита.

#       Биномното разпределение приема параметри "n" - броя на опитите
#   и "p" - вероятността за настъпване на успех.

#       Вероятността за настъпване на събитие "x" е P(x) = C(n, x)*p^x*(1-p)^(n-x),
#   за x = 0, ..., n

#       В R, функциите за биномно разпределение са rbinom(), dbinom(), pbinom(), qbinom()

#   n - броят на симулациите,
#   size - големианта на редицата от независимите опити
#   p - вероятността за настъпване на успех от един опит

#       Частния случай, когато size = 1 поражда Бернулиево разпределение. Тоест,
#   искаме да генерираме само един опит с вероятност за успех "p"
rbinom(n = 10, size = 1, p = 0.5)
rbinom(n = 10, size = 1, p = 0.2)

#       Биномно разпределение
rbinom(n = 1, size = 6, p = 0.2)
rbinom(n = 10, size = 6, p = 0.2)

# Хвърляне на зар - 100 опита - 6 изхода
set.seed(4442)
rbd <- rbinom(n = 100, size = 6, p = 0.9)
hist(rbd)
#       Средната стойност и медианата са равни на size*p, къдетo "size" и "p" са броят на
#   опитите в редицата от експерименти и вероятността за успех.
#       Вариацията е равна на size*p*(1 - p)
summary(rbd)
var(rbd)
sd(rbd)

?dbinom(1, 10, 0.2)

#   3. Геометрично разпределение
#   Геометричното разпределение е дискретно разпределение, което показва броя на
#   опитите до настъпването на успех.
#   Вероятността е P(x) = p*(1-p)^x, за x = 0, ..., n
set.seed(46871)
rgd <- rgeom(n = 10, prob = 0.3)
rgd
length(rgd[rgd == 4])
summary(rgd)
var(rgd)


#   4. Поасоново разпределение
#   Поасоновото разпределение е дискретно разпределение, което измерва вероятността
#   "lambda" (n*p) на брой независими събития да се случат в определен интервал от време.

#   При Поасоновото разпределение "n" клони към безкрайност, a "p" клони към нула. Това
#   е и връзката между биномно разпределение и поасоново
#       Вероятността е P(x) = exp(-lambda)*lambda^x/(x!)

#   При поасоновото разпределение, средната стойност и вариацията са равни на lambda
set.seed(1477)
rpd <- rpois(n = 100, lambda = 3.4)
summary(rpd)
var(rpd)


#   5. Равномерно непрекъснато разпределение
#       Равномерното непрекъснато разпределение много наподобява равнометрното дискретно.
#   Разликата е в това, че вместо дискретни стойности, при непрекъснатото може да
#   приема в целия интервал.
#       Вероятността P(X < x) = (x - a) / (b - a)
#       Равномерното непрекъснато разпределение приема параметри a и b, които са
#   минимална и максимална стойности.
#       Геенрирането на равномерно разпределение става с функцията runif(n, a, b)
runif(1, 0, 2)
runif(5, 0, 2)

set.seed(6674)
x <- runif(1000) # get the random numbers
hist(x, prob = T, breaks = 10)

#   6. Нормално разпределение
#       Нормалното разпределение е непрекъснато разпеделение, което има два основни
#   параметъра mu (средна стойност) и sigma (стандартно отклонение).
set.seed(96637)
rnd <- rnorm(n = 1000, mean = 3, sd = 4)

summary(rnd)
var(rnd)

# Нормалното разпределение има формата на камбана
hist(rnd, prob = TRUE)

#   Всяко едно нормално разпределение, с очакване "mu" и стандартно отклонение
#   "sigma", може да се стандартизира в нормално разпределение с очакване 0 и стандартно
#   отклонение 1. Стандартизацията се нарича Z-score, а формулата е Z = (x - mean(x))/sd(x)
rnd1 <- (rnd - mean(rnd)) / sd(rnd)


#   R притежава функция "scale", която го прави автоматично. Функцията е притежава
#   параметрите center (булева или числова променлива) и scale (булева или числова
#   променлива)
rnd2 <- scale(rnd)
all(rnd1 == rnd2)   #   Проверяваме дали всички стойности на rnd1 и rnd2 са равни

#   7. Експоненциално
#       Друго важно непрекъснато разпределение е екопоненциалното. Това разпределение
#   e подходящо за употреба в случаи, когато имаме работа с промеливи, свързани с време.
#   Експоненциалното разпределение има само един параметър lambda.
#       Експоненциалното разпределение се свързва с Поасоновото разпределение и като с
#   него се оценява времето между настъпванията на две събития. Това разпределение се
#   разглежда и като непрекъснат аналог на геометричното разпределение.
#       Средната стойност на експоненциалното разпределение е равна на 1/lambda, а
#   вариацията = 1/lambda^2.
set.seed(7114)
lambda <- 1
red <- rexp(1000, rate = 1/lambda)
hist(red)
summary(red)
var(red)

#   8. Boostrap
#       Booostrap е метод, който представлява създаване на извадка с големина, равна на
#   големината на вектора X и всеки елемент от X може да участва повече от веднъж в новата
#   извадка.
data(faithful)
names(faithful)
eruptions <- faithful[, "eruptions"]
sample(eruptions, 10, replace = TRUE)

par(mfrow = c(1, 2))
hist(eruptions, breaks = 25)
hist(sample(eruptions, length(eruptions), replace = TRUE), breaks = 25)
par(mfrow = c(1, 1))

