# Comparing Arrays and Matrices

# Array

y <- array(c(1:12), dim = c(2,2,3))
is.array(y)
is.matrix(y)
is.integer(y)
dim(y)
length(y)
plot(y)
#for arrays, R fills the columns, then the rows, and then the rest.

# Matrix
mat <- matrix(1:9,nrow = 3, ncol = 3)
dim(mat)
length(mat)
# matrix is also filled as columns first and then rows
x <- c(1:10)
plot(x, col ="green")
