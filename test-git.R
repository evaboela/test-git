# Advanced R course
library(advr38pkg)
remotes::install_github("privefl/advr38pkg") 

# Debut with browser() or debugonce()

seq_len(0)
n <- 10
seq_len(n-2)

# Automatic conversions will always be from a more specific mode to a more 
# general one: logical to double, and either of those to character.
# When converting numeric to logical, 0 turns into FALSE, anything else turns into TRUE

(mat <- matrix(sample(c(TRUE, FALSE), 12, replace = TRUE), 3))

mat + 0
(vec <- 1:12)

# dim() is used to get or set the dimension of the specified matrix, array or data frame
dim(vec) <- c(3,4)
vec
(vec1 <- 1:12)

# Arrays are the R data objects which can store data in more than two dimensions. 
# For example − If we create an array of dimension (2, 3, 4) then it creates 4 
# rectangular matrices each with 2 rows and 3 columns. Arrays can store only data type.
# An array is created using the array() function. It takes vectors as input and 
# uses the values in the dim parameter to create an array.
array(vec1, dim=c(3, 2, 2))
# We could yield the same result by using the dim() function on vec and assign 
# number of matrices, rows and columns to it
dim(vec) <- c(3, 2, 2)
class(vec)

# data.frame: a list whose elements have the same lengths, and formatted 
# somewhat as a matrix. In a data frame the columns contain different types of
# data, but in a matrix all the elements are the same type of data.
head(iris)
dim(iris) # 150 rows and 5 columns
length(iris) # =5, meaning a length of 5 vectors (each with vertical L=150)

# runif() generates random compositions with a uniform distribution
(x <- runif(5))

# The [ accessor is used to access a subset of the data with the same class.
x[2:4]

# Make a matrix of 12 random compositions of uniform distribution in 4 rows
y <- matrix(runif(12), 4)
y[3:9] ## a matrix is a vector
l <- list(a = 2:3, b = "toto", c = runif(10))
df <- data.frame(a=1:10, b=sample(c("Mads", "Mette"), 10, replace=TRUE), c=runif(10))
df

# The [[ accessor is used to access a single element.
x[[2]]
x[2]
head(iris[3])
head(iris[[3]])
iris[["Species"]]

mat <- matrix(1:12, 3)
mat[1,]
mat[,4]
mat[,2:3]
mat[1,2]
mat[1,2:3]
mat[1,1:2, drop=FALSE]
u <- rbind(1:10,2:11)
class(u)

(two_col_ind <- cbind(1, 1:2))
mat
mat[two_col_ind] # Svarer til at bede om række 1, kolonne 1 + række 1, kolonne 2
mat[] <- 2
mat
colSums(mat)
1
# Exercise
advr38pkg::sum_every(1:10, 2)

n <- 2
sum_every <- function(x, n) {
  1 <- length(x)
  dim(x) <- c(n, 1/n)
  colSums(x)
  
}