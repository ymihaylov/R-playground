#   Data frame
#   Друга структура за съхраняване на данни в R е data frame. Разликата с матрицата е,
#   че елементите в матрицата е вектор от вектори и всички елементи са от един тип, докато
#   data frame-a е лист от вектори и елементите на data frame-а са от един тип, само в рамките
#   на отделния вектор.

set.seed(104)

#	Искаме да създадем data frame със симулирани 30 наблюдения.
N <- 30

girl_names <- c("Ashley Cooper", "Doris Parker", "Linda Torres", "Cynthia Collins", "Paula Taylor",
                "Maria Perez", "Kelly Gray", "Wanda Bryant", "Kimberly Griffin", "Theresa Watson",
                "Ruby Brown", "Christine Wright", "Rose Washington", "Marilyn Perry", "Teresa Baker",
                "Andrea Roberts", "Amanda Reed", "Tina Harris", "Judy Murphy", "Nicole Howard",
                "Susan Flores", "Janice Martin", "Pamela Johnson")

boys_dating_diary <- data.frame(
  #	Dates - 30 дни от днес назад
  asking_for_dating_DATE = as.Date(Sys.time()) - N:1,
  #	Strings - names of the girls
  girl_names = sample(x = girl_names, size = N, replace = T),
  # Boolean
  accept = sample(x = c(T, F), size = N, replace = T, prob = c(0.1, 0.9)),
  # Uniform distribution from 1 to 10
  rating = round(runif(N, 1, 10))
)

sample(x = girl_names, size = N, replace = T)
sample(x = c(T, F), size = N-10, replace = T, prob = c(0.1, 0.9))
sort(round(runif(N, 1, 10)))
?runif

#	- N:1 - създава се вектор с числа от N до 1 (намаляващ вариационен ред)
#	- sample(x, size, replace, prob) - на случаен принцип се избират
#	 - x - вектор, от който се избират елементите,
#	 - size - размерът на желаната извадка (в нашия случай 30),
#	 - replace - опцията дали да се преизбират наново елементи.
#   Ако size > x, то задължително трябва replace = TRUE
#	 - prob - вектор с вероятностите за избиране на случаен елемент.
#   Трябва дължината на prob да бъде равна на дължината на x и сборът да бъде равен на 1.

# Date frame to string
str(boys_dating_diary)

# В R можем да вземем първите и последните няколко реда с помощта на функциите head() и tail()
# Default for n is 6
head(x = boys_dating_diary)
head(x = boys_dating_diary, n = 3)
tail(x = boys_dating_diary, n = 3)

# Обединяване на матрици и data frame-ове по редове и колони
# Union of metrices by rows and cols
M1 <- matrix(data = 1:20, nrow = 10, byrow = T)
M2 <- matrix(data = 21:30, nrow = 2, byrow = T)
M1; M2

# Функциите за обединяване на две матрици/data frame-ове са:
# - rbind - обединение по редове - долепя втората матрица под първата
# - cbind - обединение по колони - долепя втората матрица след първата

# Error! Numbers of Rows and Columns must match!
rbind(M1, M2)

# Check dimensions of matrices
nrow(M1)
ncol(M1)
dim(M2)

# Transponse matrices
# Нека да транспонираме втората матрица (транспонирането е операция, за която редовете се
# превръщат в колони). Функцията за транспониране в R е t()
M2.t <- t(M2)
M2
M2.t
dim(M2.t)

rbind(M1, M2.t)

# Union of cols
M3 <- matrix(data = 21:40, nrow = 10, byrow = T)
cbind (M1, M3)

# cbind and rbind on Date Frames
boys_dating_diary_2 <- data.frame(
  #	Dates - 30 дни от днес назад
  asking_for_dating_DATE = as.Date(Sys.time()) - 30 -N:1,
  #	Strings - names of the girls
  girl_names = sample(x = girl_names, size = N, replace = T),
  # Boolean
  accept = sample(x = c(T, F), size = N, replace = T, prob = c(0.5, 0.5)),
  # Uniform distribution from 1 to 10
  rating = round(runif(N, 1, 10))
)
test = cbind(boys_dating_diary, boys_dating_diary_2)

# Функциите apply, lapply, sapply и т.н. могат да се прилагат и върху data frame-ове

# Взимане на ред, колона и елемент от data frame
# Всеки от начините, които споменахме при взиамне на елементи от матрица, са приложими и
# за data frame, като отделно имаме и допълнителни.

#	dataframe[rows, cols]

# First row and every columns
boys_dating_diary[1, ]

# First col of every row
boys_dating_diary[, 1]
boys_dating_diary[1:nrow(boys_dating_diary), 2]

# Fifth row - second and third col
boys_dating_diary[5, c(2, 3)]

# Fifth row, second col
boys_dating_diary[5, 2]

#	Get or set row names
row.names(boys_dating_diary)
row.names(boys_dating_diary) <- paste("try", 1:nrow(boys_dating_diary), sep = "_")
#	С paste() обединяваме вектори със стрингове (n-тия елемент на единия вектор с n-тия елемент на друг вектор)
# Имената трябва да са уникални

# При data frame-а можем да вземем елементи и посредством техните имена

# - По колони
#	С "$" взимаме елементи от листа. Data frame-а е ЛИСТ от ВЕКТОРИ => взимаме вектора
boys_dating_diary$girl_names
boys_dating_diary[, "girl_names"]
boys_dating_diary[, 2]
# Последните 3 са еквивалентни

# - По редове - име на реда
boys_dating_diary["try_1", ]

# - По имена на редове и колони
boys_dating_diary["try_1", c("girl_names", "accept")]

# -----------
# Филтриране
# Следващата стъпка е филтрирането на данни и взимането на подгрупи по зададен признак

#	& - логическо "и", | - логическо "или", == - проверка за равенство

# which() - Връща вектор с индекстите на елементите, за които булевото условие връща TRUE.
#	Тоест взимаме индексите на елементите, които ни вълнуват по някакъв начин.

# Нека да проверим кои от всички 30 опита са се оказали сполучиливи. Тоест,
# приели са поканата на момчето
# Връща реда
which(boys_dating_diary$accept)
# Prints the rows
boys_dating_diary[which(boys_dating_diary$accept), girl_names]
# Prints only the names
boys_dating_diary[which(boys_dating_diary$accept), "girl_names"]

# More complex filter
boys_dating_diary[which(boys_dating_diary$rating >= 7 & boys_dating_diary$accept), ]
# Returns only FALSE AND TRUE for every row
boys_dating_diary$rating >= 7

# Where IN
boys_dating_diary[which(boys_dating_diary$girl_names %in% c("Doris Parker", "Theresa Watson")), ]

# Как да вземем имената на момичетата, с които въпросният индивид се е опитал да се свърже през последната седмица?
# Дали са приели?
lastWeekdays <- as.Date(Sys.time()) - 7:0
boys_dating_diary[which(boys_dating_diary$asking_for_dating_DATE %in% lastWeekdays), ]

attach(boys_dating_diary)
girl_names
detach(boys_dating_diary)

# ------------------------------------------------------------------------
#                           О П И С А Т Е Л Н А    С Т А Т И С Т И К А
#   1. Променливи
#   Най-простата дефиниция за променливи е характеристика, която се варира от един човек/обект
#   до друг. Променливите са категоризирани в два типа
#   - количествени или числови (представят се с числа)
#   - категорийни или качествени (нечислово изобразяване)

#   Категорийните променливи се разбиват на два подтипа
#   - номинални (без подредба) - Примери за стойности на НОМИНАЛНИ променливи са: видове заведения, различни
#   държави и организции, видове алкохол, раси и т.н.
#   - ординални (с подредба) -  Примери за стойности на ОРДИНАРНИ променливи са:
#   степени на образование/квалификация, нива на социалните общества и т.н.

#   Количествените се разбиват на два подтипа
#   - Непрекъснати (стойностите могат да варират в даден числов интервал)  - възраст, различни съотношения, тегло
#   - Дискретни (възможните стойности могат да бъдат изброени) - брой катастрофи на шофьори, брой на деца

#   2. Разпределения
#   Разпределение - това е таблица, графика или формула, съдържаща стойностите на наблюденията
#   и колко често се случват. Разпределенията се характеризират с
#   - форма
#   - модалност (modality)
#   - локация
#   - размах
#   - симетричност/асиметричност
#   - ексцес.
#   - плътност

# ------------------------------------------------------
#   На графиката по-долу са представени няколко от формите на плътността на разпределенията
N <- 2*(10^4) # 20k
distributions <- c("Kambanovidna", "J-", "Pravoygylna", "Dqsno asimetrichna", "Dvumodalna")
par(mfrow = c(2, 3))

for (distr in distributions) {
  distribution_values <- switch(distr,
    "Kambanovidna" = rnorm(N), # Normal distribution
    "J-" = rexp(N), # Exponential distribution
    "Pravoygylna" = round(runif(N), 2), # Uniform distribution - Равномерно разпределение
    "Dqsno asimetrichna" = rgamma(N, shape = 5),   # Gamma distribution
    "Dvumodalna" = c(rnorm(N, mean = -2, sd = 2), rnorm(N, mean = 3, sd = 1)) #
  )

  distr_density <- density(distribution_values)
  ?hist
  hist(
    distribution_values,
    col = "pink",
    prob = T,
    main = paste(distr, "forma na razpredelenie"),
    ylab = "Density",
    xlab = "Values",
    ylim = range(distr_density$y),
    xlim = range(distr_density$x)
  )

    lines(distr_density, lwd = 3, col = "blue") # lwd - width of line
}
par(mfrow = c(1, 1))

# ----------------------------------------------------------------------
# Salaries
country = c('Switzerland', 'Norway', 'Iceland', 'Denmark', 'Finland', 'Netherlands', 'Germany',
            'Ireland', 'Sweden', 'United Kingdom', 'Austria', 'Belgium', 'France', 'Italy',
            'Spain', 'Malta', 'Slovenia', 'Estonia', 'Czech Republic', 'Portugal', 'Slovakia',
            'Poland', 'Croatia', 'Lithuania', 'Greece', 'Latvia', 'Hungary', 'Romania',
            'Bulgaria', 'Russia', 'Bosnia And Herzegovina', 'Serbia', 'Belarus', 'Albania',
            'Macedonia', 'Ukraine', 'Moldova')

avg_sal_in_USD = c(4959.48, 3416.1, 3136.95, 2975.8, 2583.43, 2575.2, 2538.92, 2521.51, 2494.39,
                   2394.78, 2219.23, 2162.23, 2140.64, 1675.32, 1480.64, 1278.04, 1180.66,
                   1158.76, 1069.03, 925.84, 894.2, 884.81, 852.23, 804.68, 795.34, 771.91,
                   708.91, 649.68, 611.41, 558.01, 481.17, 412.22, 409.62, 348.56, 346.15,
                   293.26, 284.94)

salaryDF <- data.frame(country, avg_sal_in_USD)

# Cars
Country <- c("Austria", "Belgium", "Croatia", "Czechia", "Denmark", "Estonia", "Finland",
             "France", "Germany", "Greece", "Hungary", "Ireland", "Italy", "Latvia",
             "Lithuania", "Luxembourg", "Netherlands", "Norway", "Poland", "Portugal",
             "Romania", "Slovakia", "Slovenia", "Spain", "Sweden", "Switzerland", "UK")

Car <- c("Volkswagen", "Volkswagen", "Skoda", "Skoda", "Peugeot", "Toyota", "Nissan",
         "Renault", "Volkswagen", "Toyota", "Suzuki", "Hyundai", "Fiat", "Volkswagen",
         "Fiat", "Volkswagen", "Volkswagen", "Nissan", "Skoda", "Renault", "Dacia",
         "Skoda", "Renault", "Seat", "Volvo", "Skoda", "Ford")

carsDF <- data.frame(Country, Car)

# --------------------------------------------------------------------------------
#                   А Н А Л И З    Н А    Е Д Н О М Е Р Н А    П Р О М Е Н Л И В А
#                                   (UNIVARIATE ANALYSIS)

#  ------------
#  3. Категорийни променливи
#  Категорийните промеенливи като цяло носят по-малко информация отколкото числовите променливи.
#  Често обаче, те носят по-голяма стабилност за прогнозните моделите отколкото числовите.

#   Освен графично представяне на данните (ще го разгледаме по-късно), най-добре честотата се
#   вижда посредством таблици. Функцията, която ни трябва е table()

# Взима първите 6 реда
head(carsDF)

# Взима честотното разпределение на категориините променливи
tt <- table(carsDF$Car)
tt
sort(tt)

# Взима процентното разпределение на променливите
round(prop.table(tt) * 100, 2)
sort(round(prop.table(tt) * 100, 2))

# Volkswagen държи най-голям пазарен дял по страни в Европа, следван от Skoda

# --------------
# 4. Числови променливи
#   4.1. Оценка на центъра (локацията) на разпределение (mean)
#       4.1.1. Средна стойност (Очакване)
meanFunc <- function(x) {
  sum(x) / length(x)
}

salaryDF$avg_sal_in_USD
meanFunc(salaryDF$avg_sal_in_USD)
mean(salaryDF$avg_sal_in_USD)

#       4.1.2. Медиана (Median)
#       Подреждаме данните във вариационен ред. Взимаме средната стойност (при нечетен брой)
#   или средната стойност на средните два елемента (при четен брой елементи).

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
medianFunction(salaryDF$avg_sal_in_USD)
median(salaryDF$avg_sal_in_USD)

medianFunction(1:10)
median(1:10)

#     4.1.3. Мода - най-често срещаната стойност
modeFunction <- function(x) {
  tt <- table(x)

  return (names(tt))[tt == max(tt)]
}

table(round(salaryDF$avg_sal_in_USD / 100))

modeFunction(round(salaryDF$avg_sal_in_USD / 100))

#   Модата може да има повече от една стойност
#   table() - честотоното разпределение на променлива (коя стойност колко пъти се повтаря)
#   which.max() - връща индекса на първото число, което приема МАКСИМАЛНА стойност
#   which.min() - връща индекса на първото число, което приема МИНИМАЛНА стойност
#   names() - връща имената на стойностите

#   Описателна статистика за центъра на разпределението
summary(salaryDF$avg_sal_in_USD)

# Квантили
quantile(salaryDF$avg_sal_in_USD, prob = seq(0.1, 0.9, by = 0.1))
?quantile

#   Задача 1 - Ежедневни инциденти с мотоциклети
#   Шотландският изпълнителен директор в отдел "Аналитични услуги" на Транспортна
#   статистика събира данни за произшествията с мотоциклети. В таблицата по-долу са
#   представени, броят на инцидентите с мотоциклети в Шотландия по пътища с ограничение
#   до 30 и над 30 мили в час, случили се по дни от седмицата.
Day <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
Built_up <- c(88, 100, 76, 98, 103, 85, 69)
Non_built_up <- c(70, 58, 59, 53, 56, 94, 102)

motorcycleAccidentsDF <- data.frame(Day, Built_up, Non_built_up)
#   а. Каква е средната стойност и медианата на броя на произшествията за двата вида пътища
mean(motorcycleAccidentsDF$Built_up)
median(motorcycleAccidentsDF$Built_up)

mean(motorcycleAccidentsDF$Non_built_up)
median(motorcycleAccidentsDF$Non_built_up)

#   б. Каква е формата на разпределението по различните пътища. Интересува ни само модалността.

# Задача 2 - Инвестиции в акциите "LMT" и "FB"
Date <- c('2015-09', '2015-10', '2015-11', '2015-12', '2016-01', '2016-02', '2016-03', '2016-04',
          '2016-05', '2016-06', '2016-07', '2016-08', '2016-09', '2016-10', '2016-11', '2016-12',
          '2017-01', '2017-02', '2017-03', '2017-04', '2017-05', '2017-06', '2017-07', '2017-08',
          '2017-09', '2017-10', '2017-11', '2017-12', '2018-01', '2018-02', '2018-03', '2018-04',
          '2018-05', '2018-06', '2018-07', '2018-08', '2018-09')
FB <- c(89.9, 101.97, 104.24,
        104.66, 112.21, 106.92, 114.1, 117.58, 118.81, 114.28, 123.94, 126.12, 128.27, 130.99,
        118.42, 115.05, 130.32, 135.54, 142.05, 150.25, 151.46, 150.98, 169.25, 171.97, 170.87,
        180.06, 177.18, 176.46, 186.89, 178.32, 159.79, 172, 191.78, 194.32, 172.58, 175.73,
        164.46)
LMT <- c(207.31, 219.83, 219.16, 217.15, 211, 215.79, 221.5, 232.38, 236.23, 248.17, 252.73,
         242.97, 239.72, 246.38, 265.25, 249.94, 251.33, 266.58, 267.6, 269.45, 281.13, 277.61,
         292.13, 305.39, 310.29, 308.16, 319.12, 321.05, 354.85, 352.44, 337.93, 320.84, 314.54,
         295.43, 326.1, 320.41, 345.96)
stocksDF <- data.frame(Date, LMT, FB)

#   Анализът трябва да се извърши върху възвръщаемостите на цените, получени по diff(log(x)),
#   където "x" е цената на актива

#   а. Какви са средните стойности и медианите. Според вас как се интерпретират тези числа
#   б. Можете ли да кажете в кой актив бихте инвестирали при наличието само на тази информация

log(10, base = 10)

x = 1:5
