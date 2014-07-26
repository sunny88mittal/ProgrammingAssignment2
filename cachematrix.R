## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function defines has 4 functions in it
 # 1. To set the matrix          set()
 # 2. To get the matrix          get()
 # 3. To set the inverse         setinverse()
 # 4. to get the inverse         getinverse()
 
 #usage : To use this function first create the vector using set and then invoke other functions
makeCacheMatrix <- function(x = matrix()) {
   i <- NULL               #Intialize inverse to NULL
     
   set <- function(y) {   
       X <<- y             #Assign the matrix argument to x
       i <<- NULL          #Set the inverse value to NULL
   }
   
   get <- function() x
   setinverse <- function(inverse) i <<- inverse
   getinverse <- function() i
   
   #Create a list with all the functions defined above
   list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## Write a short comment describing this function
 # Input : makeCacheMatrix vector
 # Output : Inverse of the matrix
 # Steps : 1. Check if the inverse exists
 #         2. If 
 #               inverse exists return that
 #            else
 #               get the data from the vector
 #               compute the inverse
 #               store the inverse in the vector
 #               return the inverse
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    i <- x$getinverse()
    if (!is.null(i)) {
        message("Returning the cached value")
        return (i)
    }
    
    matrix <- x$get()
    i <- solve(matrix)
    x$setinverse(i)
    i
}

##############Test Code #####################
mat <- matrix(c(1,2,3,0,1,4,5,6,0), nrow=3, ncol=3)
cachemat <- makeCacheMatrix(mat)
cacheSolve(cachemat)   #computes the inverse 
cacheSolve(cachemat)   #returns the cached value