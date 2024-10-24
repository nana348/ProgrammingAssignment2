## A pair of functions that cache he inverse of a matrix

## Creates a special matrix object that can cache its reverse

makeCacheMatrix <- function(m = matrix()) {
  ##start the inverse
  i <- NULL
  
  ## set the matrix
  set <- function(matrix){
      m <<- matrix
      i <<- NULL
  }
  
  ## get the matrix
  get <- funtion(){
    m
  }
  
  ## set the inverse
  setInverse <- function(inverse){
    i <<- inverse
  }
  
  ## get the inverse
  getInverse <- function() {
    i
  }
  
  ##Make a list
  list(set=set, get=get, 
       setInverse=setInverse, 
       getInverse = getInverse)

}


## computes the inverse of the special matrix returned by 
## makeCacheMatrix above

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  
  data <- x$get()
  
  m <- solve(data)%*% data
  
  x$setInverse(m)
  
  m
}
