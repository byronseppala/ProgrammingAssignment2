## These functions create and manage a matrix object that is able to cache its 
## inverse and return it without computing it again

## This function stores the state of the matrix, the fields being the matrix x
## and its inverse xInv
makeCacheMatrix <- function(x = matrix()) { 
        xInv <- NULL
        
        ## The set function acts as a constructor function for the matrix
        set <- function(data = NA, nrow = 1, ncol = 1, byrow = FALSE, dimnames = NULL) {
                x <<-matrix(data, nrow, ncol, byrow, dimnames)
                xInv <<- NULL ## When the matrix is altered (set() is called) the 
                              ## inverse is set to NULL
        }
        
        ## This is a simple get function, returning the value of the matrix
        get <- function() x
        
        ## The setInv() function allows the user to set xInv from outside the function
        setInv <- function(inv) xInv <<- inv
        
        ## Returns the inverse of x
        getInv <- function() xInv
        
        ## This list is returned, containing all the functions in makeCacheMatrix()
        list(set = set, get = get, setInv = setInv, getInv = getInv)
}

## This function returns the inverse of x. It gets this value from the cache
## if it exists, or calculates it if it doesn't exist
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getInv()
        if(!is.null(inv)) { ## Asks if the inverse has already been calculated
                message("getting cached data")
                return(inv)
        }
        matA <- x$get()
        inv <- solve(matA)
        mat$setInv(inv)
        inv
}
