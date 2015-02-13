## Put comments here that give an overall description of what your
## functions do
## This function creates an object with four functions: get(), set(),
## getinverse(), setinverse() and the second function calculates the inverse
## matrix of the input or get it from the memory

## This function creates an object with four functions: get(), set(),
## getinverse(), setinverse() 

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  set_inverse <- function(inv) i <<- inv
  get_inverse <- function() i
  list(set = set, get = get, set_inverse = set_inverse, get_inverse = get_inverse)
}


## This function calculates the inverse
## matrix of the input or get it from the memory

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$get_inverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$set_inverse(i)
  i
}
