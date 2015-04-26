## These functions will cache a matrix and its inverse


## This function creates a special matrix and caches it. subsetting
##	the get portion will return the matrix, if there is no inverse calculated, then getinverse will return a null.
makeCacheMatrix <- function(x = matrix()) {
 m <- NULL
set <- function(y){
    x <<- y
    m <<- NULL
}

get <- function() x
setinverse <- function(inverse) m <<- inverse
getinverse <- function() m
list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function will retrieve the cached matrix from makeCacheMatrix
## and invert it. Then it will cache the result. If the inverse is
## already cached, then it will print a message and retrieve the
## cached result instead.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    
      if(!is.null(m)) {
              message("getting cached data")
              return(m)
      }
      data <- x$get()
      m <- solve(data,...)
      x$setinverse(m)
      m
  
}
