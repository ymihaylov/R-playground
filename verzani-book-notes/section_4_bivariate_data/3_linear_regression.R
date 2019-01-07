# Linear regression is the name of a procedure that fits a straight line to the data.
# The idea is that the x value
# is something the experimenter controls
# The line is used to predict the
# value of y for a known value of x.
# The variable x is the predictor variable and y the response variable.

data(home);attach(home)
x = old
y = new
plot(x, y,  col = c('red', 'green'))
abline(lm(y ~ x))
?lm(y ~ x)

simple.lm(x, y)

lm.res = simple.lm(x, y)
coef(lm.res)

# ---
# Residual plots
simple.lm(x, y, show.residuals=TRUE)
lm.res = simple.lm(x,y)
the.residuals = resid(lm.res) # how to get residuals
plot(the.residuals) # https://www.btu.bg/statexcel/file8_1.html

# ---
# Correlation coeficients
cor(x, y)
cor(x,y)^2

summary(lm(y ~ x))
rank(c(2,3,5,7,11))
rank(c(5,3,2,7,11))
rank(c(5,5,2,7,5))
cor(rank(x), rank(y))
