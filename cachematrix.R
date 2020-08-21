## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## The first function "makeCacheMatrix" creates a special matrix object that can cache its inverse
makeCacheMatrix <- function( ma = matrix() ) {
  
  ## Initializing the inverse property of the function
  inv <- NULL
  
  ## How to set the matrix
  set <- function( matrix ) {
    ma <<- matrix
    inv <<- NULL
  }
  
  ## How to get the matrix
  get <- function() {
    ## Return the matrix
    ma
  }
  
  ## How to set the inverse of the matrix
  setInverse <- function(inverse) {
    inv <<- inverse
  }
  
  ## How to get the inverse of the matrix
  getInverse <- function() {
    ## Return the inverse property
   inv 
  }
  
  ## Returning a list of the methods
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}



## Write a short comment describing this function

## The second function "cacheSolve" should retrieve the inverse from the cache.

cacheSolve <- function(y, ...) {
  
## Returning a matrix that is the inverse of 'y'
ma <- y$getInverse()

## Returning the inverse if its already set
if( !is.null(ma) ) {
  message("getting cached data")
  return(ma)
}

## Getting the matrix from our object
data <- y$get()
## Calculating the inverse using matrix multiplication option
ma <- solve(data) %*% data

## Setting the inverse to the object
y$setInverse(ma)

## Finally, returning the matrix
ma
}
