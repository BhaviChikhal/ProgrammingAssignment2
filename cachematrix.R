## Put comments here that give an overall description of what your
## functions do

## The first function,makeCacheMatrix creates a "matrix",which is really a list 
## containing a function to

## 1.set the value of the matrix
## 2.get the value of the matrix
## 3.set the value of inverse matrix
## 4.get the value of inverse matrix

makeCacheMatrix <- function(x = matrix()) {
    inv<-NULL
    set<-function(y){
        x <<- inv
        inv <<- NULL
        
    }
    get<-function() x
    setinverse<-function(inverse) inv<<-inverse
    getinverse<-function() inv
    list(set = set, get=get, 
         setinverse=setinverse,
         getinverse=getinverse)
    

    

}


## The following function does the inverse of the"matrix" 
##created with the above function. However, it first checks to see if
##the inverse of the matrix is already there. 
##If so, it gets the inverse from the cache and skips the computation. 
##Otherwise, it calculates the inverse of the matrix 
##and sets the value of the matrix in the cache via the setinverse function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv<-x$getinverse()
    if(!is.null(inv)){
            message("getting cached data")
            return(inv)
    }
      data <-x$get
      inv<-solve(data,...)
      x$setinverse(inv)
      inv
}
