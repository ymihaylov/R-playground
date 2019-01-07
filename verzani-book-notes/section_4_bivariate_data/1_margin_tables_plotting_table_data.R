# Suppose a student survey is done to evaluate if students who smoke study less. 
smokes <- c("Y","N","N","Y","N","Y","Y","Y","N","Y")
amount <- c(1,2,2,3,3,1,2,1,3,2)

tmp <- table(smokes, amount) # stores table
old.digits <- options("digits") # store the number of digits
?options
options(digits=3) # Only print 3 decimal places

prop.table(tmp, 1) # Col sum to 1
?prop.table # Marginal table

prop.table(tmp) # All the numbers sum to 1

options(digits=old.digits) # restore the digits

# ----- Plotting
barplot(table(smokes, amount))
barplot(table(amount, smokes))
smokes <- factor(smokes) # for names
barplot(table(smokes, amount), beside=TRUE, legend.text=T)

barplot(
  table(amount, smokes), 
  main="table(amount,smokes)", 
  beside=TRUE, 
  legend.text=c("less than 5","5-10","more than 10")
)

# Some Extra Insight: Conditional proportions
prop <- function(x) x/sum(x)
apply(x, 2, prop)

t(apply(x,1,prop))

