## Put comments here that give an overall description of what your
## functions do

## Similar to example, this function creates a "matrix" object
## that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    matrixinv <- NULL
    set <- function(y) {
      x <<- y
      matrixinv <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) matrixinv <<- inverse
    getInverse <- function() matrixinv
    
    list(set = set,
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)

}


## This function will check the result in cache and on avaibility use the result
## or else calculate it

cacheSolve <- function(x, ...) {
  matrixinv <- x$getInverse()
  if(!is.null(matrixinv)){
    message("getting cached matrix")
    return(matrixinv)
  }
  mat <- x$get()
  matrixinv <- solve(mat, ...) #This here will give inverse of a matrix
  x$setInverse(matrixinv)
  matrixinv
        ## Return a matrix that is the inverse of 'x'
}
