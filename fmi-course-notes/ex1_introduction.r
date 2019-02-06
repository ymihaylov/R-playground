# Install Package
install.packages("UsingR")
install.packages("Hmisc")

# List installed packages
installed.packages()

# List names
row.names(installed.packages())

# Load package
library(UsingR)

# R help
help(row.names)
?row.names
# Search for help in R
??lenear

# Assign Variables
x = 5
y <- 2*x + 6
"Austria" -> z

# Data structures
# 1. Vector / array
v1 = c() # Empty vector
v1 = c(1, 4, 6., 4, 7, 12., -17) # Vector with numbers
v1

# Add new elements to vector
v2 = c("a", "b", "c")
v2
v12 = c(v1, v2)

# Check types of vectors
str(v1)
str(v2)
str(v12) # Casted to string vector

str(c(1, 2, 'p'))
typeof(c(1, 2, 'p'))

# Date vector
v3 = as.Date(c("2015-01-01", "2016-07-08"))
?as.Date # Convert strings to dates

# The merge between numbers and dates converts dates to integer.
# This integer presents count of the days since 1970-01-01
v13 <- c(v1, v3)
as.numeric(v13)

# As is used for force an object to belong to a class
# Force to be casted to number - strings are replaced by NA
as.numeric(v12)

# No problem everything include numbers can be presented as string
as.character(v1)

# ERROR, start date for counting the days is not set
as.Date(v1)
# Origin is start date of countring
as.Date(v1, origin = "2011-01-01")

v1.temp = c(1, 2, 2, 4, 5, 7, 18, -19)
# Gets length of the vector
length(v1.temp)

# Gets max value
max(v1)

# Gets sum of elements
sum(v1)

# Check which element is 2
v1.temp == 2

# Count of elements equals to 2
sum(v1.temp == 2)

# Get element from vector
# Indexing starts from 1!
v1[1]

# New vector that contains first and last element from v1
v1[c(1, length(v1))]

# Vector with four times third element of v1
v1[c(3, 3, 3, 3)]

# Create a sequences
# Returns vector with elemnents 1 to 10
1:10
10:1

# Multiplies vector
temp = 1;
for (i in 1:3) {
  temp = temp * i
}
temp

# Equivalent, but with function
seq(from = 1, to = 10, by = 1)
seq(from = 10, to = 1, by = -1)

# Third, Sixth and from First to Fourth element
v1[c(3, 6, 1:4)]

# In R we can create a subvector. The values that we DON'T want!
# Не искаме елементите от 3 до 6
v1[-c(3, 6)]

# Всички елементи без първия
v1[-1]

# Всички елементи без от 3ти до 6ти
v1[-(3:6)]

#   За да не ни се налага да се чудим какви числа да измисляме всеки път, то най-добре е
#   всичко до оставим в ръцете на "съдбата". Тоест да генерираме нашите числа на случаен принцип.

#   Създаваме 3 вектора с генерирани псевдослучайни величини. За да получаваме винаги една и
#   съща редица от числа, то трябва винаги да стартираме от една и съща начална позиция. За тази
#   цел използваме командата set.seed(...).
#   Искаме числата, които се генерират в трите вектора, да се падат с равни вероятности. Тоест
#   P(1) = P(2) = ... = P(n-1) = P(n), където P(x) е вероятнсотта да се падне числото x.

#   В упражненията ще учите подробно различните вероятностни разпределения, но за момента е
#   достатъчно да знаем, че този вид разпределение се нарича "равномерно".

#   Равномерно разпределение е когато всяка една от стойностите е с равна вероятност да се падне.

# Histogram of random numbers
# Uniform Distribution
hist(
  trunc(runif(n = 10^3, min = 1, max = 5.9999)),
  col = "red",
  main = "Histogram",
  xlab = "Pseudo random numbers"
) # чертае хистограма на данните 

runif(n = 10^3, min = 1, max = 5.9999) # Прави random 1000 числа със стойности от 1 до 6
trunc(runif(n = 10^3, min = 1, max = 5.9999)) # trunc маха дробната част от числата
table(trunc(runif(n = 10^3, min = 1, max = 5.9999))) 
?runif
##############################

# Set Seed and Uniform Distribution
set.seed(1806)
v4 = trunc(runif(n = 20, min = 1, max = 40.99999)) # генерира равномерно разпределени числа
set.seed(2713)
v5 <- round(runif(n = length(v4), min = 1, max = 40.99999))
set.seed(189)
v6 <- round(runif(n = length(v4) - 7, min = 1, max = 40.99999))

# Генерира псевдо случайни равномерно разпределени числа.
?runif

# Operations with vectors
# Add 3 to every element
v4 + 3

# Miltiply every element from vector with 2
v4 * 2

# Complex expression
(v4/7) + 11

# Скаларно произведение 
# Вектор по вектор 
# Трябва да са с равни дължини двата вектора 
v4 * v5

# Дава предупреждение, защото дължината на втория вектор не е кратна на първия.
v4 * v6

# Change first 4 elements
v4.prime <- v4
v4[c(1, 2, 3, 4)] = 4

# ---------
# Functions
func1 <- function(a, b, c) {
  return (a + b + c)
}

func1(1, 1, 1)

# Functions with default params
func2 <- function(a, b = 2, c = 3) {
  print(paste('A:',a))
  print(paste('B:',b))
  print(paste('C:',c))
  
  return (a + b + c)
}

# С paste се конкатенират string-ове

func2(3, 3, 1)
func2(b = 3, c = 3, a = 1)
func2(1, c = 3) 
func2(b = 2, c = 3) # ERROR - a doesnt have default value

# Check for value in the function
#   Командата "missing" проверява дали имаме стойност за параметъра "a"!
#   С "print()" извеждаме съобщение
#   С "rnorm(n = 1)" генерираме една (n = 1) нормално разпределена случайна величина
#   с очакване 0 и стандартно отклонение 1
func3 <- function(a, b = 0, c = 0) {
  if(missing(a)) {
    print("You don't enter value for \"a\". The function generate normal distributed value")
    a <- rnorm(n = 1)
  }
  return(a + b + c)
}
rnorm(n = 1) # Генерира нормално разпределение

func3(b = 2, c = 3)

func4 <- function(a, b = 2, c = 3) {
  if(missing(a)) {
    a <- NA
  }
  
  Obj <- NULL
  Obj$number1 <- a
  Obj$number2 <- b
  Obj$number3 <- c
  
  Obj # return(Obj)
}

obj <- func4()

# ----------------
# if-else statement

# if() {
#
# } else if() {
#
# } else {
#
# }

# ----------------
# Loops
# for (...) {} - foreach iteration
v7 <- c("a", "b", "c", "d", "e")
for(i in v7) {
  print(i)
}

for(i in 1:length(v7)) {
  print(v7[i])
}

# Reverse iterating
for(i in length(v7):1) {
  print(v7[i])
}

# How to skip iteration?
for (i in 1:length(v7)) {
  if (i == 4) {
    print("----MISS")
    next # continue; skip iteration;
  }
  
  print(v7[i])
}

# while loop
counter <- 0
while(counter < 5) {
  counter <- counter + 1
  print(counter)
}

# Repeat loop # Only exits with break;
counter <- 0
repeat {
  counter <- counter + 1
  print(counter)
  
  if (counter >= 5) {
    break;
  }
}

#   Циклите в R са бавни. Ето защо е подходящо в някои случаи да използвате методите
#   apply, lapply, sapply, vapply и tapply. Тези методи ще ги представим след малко.

# ---------------------------
# 2.  Matrix
# List Of values; like array_map;
l1 <- lapply(1:12, function(x) {x})

#   С функцията "matrix" в R създаваме матрица от предварително зададено множество от
#   стойности - вектор или лист със стойности. Освен множеството с елементи, трябва да
#   посочим и формата на матрицата - брой редове и колони. Стойностите на матрицата се
#   пълнят по колони. За да напълним матрицата със стойности по редове, трябва да използваме
#   параметъра byrow = TRUE

# These two rows are equivalent:
M1 <- matrix(data = l1, nrow = 4, ncol = 3)
M1 <- matrix(data = 1:12, nrow = 4, ncol = 3)

# Fill by row
M2 <- matrix(data = 1:12, nrow = 4, ncol = 3, byrow = T)
M2[,2]
M1
M2

# Fetch element from matrix, row, col, and sub-matrix
M3 <- matrix(data = c(1:28), nrow = 7, ncol = 4, byrow = TRUE)
# Print the whole matrix
M3
# Fetch Row
M3[2,]
# Fetch Column
M3[ ,3]
# Fetch Element
M3[1, 3]
# Fetch 1st and 2nd element from 3rd col
M3[c(1, 2), 3]
# Fetch Submatrix
M3[c(1, 2), c(3, 4)]

# Operations with matrix
# Adds 4 to every element from the matrix
M3 + 4

#   Добавяме по вектор към всеки от четирите колони
M3 + 5*c(1:7)
M3
M3 + c(1:4)

#   Добавяме ред вектор всеки от седемте реда на матрицата
M3 + 5*c(1:4)

#   R автоматично удвоява вектора до дължина 4 и добавяме вектора към всеки ред
M3 + 5*c(1:2)

#   Аналогично е и при умножение на матрица с вектор
M4 <- matrix(1:8, nrow = 4, ncol = 2)
M4

#   Стандартно умножение на две матрици
#   M(7x4) * M(4x2) = M(7x2)
M34 <- M3 %*% M4
M34

# Size of matrix
dim(M34)
# Number of rows
nrow(M34)
# Number of cols
ncol(M34)

#   Функцията apply се прилага върху матрици, data.frame и други производни структури.
#   Първият параметър е множеството от данни, вторият показва по редове (1) или колони (2) искаме
#   да направим трансформациите, а третият е самата функция
?apply
apply(M3, 2, function(x, a) {
  sum(x)
}, a)

apply(M3, 1, function(x) {
  sum(x)
})
