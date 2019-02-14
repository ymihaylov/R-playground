# ---------
# Задача 3
# Условна вероятност
# Снимка 1

t = table(x, y)
t[1, 2] / sump(t[, 2])
?sum

l1 <- lapply(1:12, function(x) {x}) #  лист
M1 <- matrix(data = l1, nrow = 4, ncol = 3)
 
x <- c(1, 2, 3)
y <- c('a', 'b', 'c')

t <- table(x, y)  
sum(t[,2])
?prop.table(t, 2)
