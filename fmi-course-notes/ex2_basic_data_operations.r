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
boys_dating_diary[which(boys_dating_diary_2$accept), ]
# Prints only the names
boys_dating_diary[which(boys_dating_diary$accept), "girl_names"] 

# More complex filter
boys_dating_diary[which(boys_dating_diary_2$rating >= 7 & boys_dating_diary_2$accept), ] 
# Returns only FALSE AND TRUE for every row
boys_dating_diary_2$rating >= 7 

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

#   На графиката по-долу са представени няколко от формите на плътността на разпределенията
N <- 2*(10^4) # 20k
distribution <- c("Комбановидна", "J-", "Правоъгълна", "Дясно асиметрична", "Двумодална")
par(mfrow = c(2, 3))
