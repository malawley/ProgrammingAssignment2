## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#this function creates a matrix in a different environment. It also creates functions for dealing with that matrix.
#these functions include get(), setInv(X),getInv(). 

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInv <- function(x) m <<- solve(x)
  getInv <- function() m
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)
}

## Write a short comment describing this function
#this function creates a matrix in a different environment.
#it uses functions defined in makeCacheMatrix to invert the matrix, retrieve it, and so forth.
# example usage is given below

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  m <- x$getInv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInv(m)
  m
}

# > junk3 <-makeCacheMatrix(matrix(c(1:4),2))
# > cacheSolve(junk3)
# [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
# > cacheSolve(junk3)
# getting cached data
# [,1] [,2]
# [1,]    1    3
# [2,]    2    4
# > 


