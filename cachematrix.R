## Solve the the inverse of a matrix, cache the results then check
## to see if the results are cached before returning the value of
## this expensive operation.
##
## Usage:
## > source("cachematrix.R")
## > a <- makeCacheMatrix(matrix(1:4,nrow= 2, ncol=2))
## > cacheSolve(a)

## Solve for the inverse of a given square matrix and cache the
## results in memory.

makeCacheMatrix <- function(x = matrix()) {
        # define the variable m as NULL so we know that it's defined
        # within the scope of makeCacheMatrix()
        m <- NULL

        ### Getters & Setters ###
        # create a 'setter'
        # these set a value within makeCacheMatrix() 
        set <- function(y) {
                # Vectors are now present within the scope of set()
                x <<- y
                m <<- NULL
        }
        # create a 'getter'
        # these get a value within makeCacheMatrix()
        get <- function() x
               ## Why use getters and setters?
               # http://stackoverflow.com/questions/1568091
        
        # solve() finds the inverse of a matrix
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m

        # return value for the function
        # values are returned within the scope of makeCacheMatrix()
        list(set = set, get = get, # This is a list of the internal
             setsolve = setsolve,  # functions ('methods') so a 
             getsolve = getsolve)  # calling function knows how to
                                   # access those methods.
                                   # You down with OOP?
}


## Checks to see if the results are cached in memory, if not solves

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

        ## Getters & Setters
        # Check to see if the x vector contains a getter and assign
        # it to the vector M, which has been previously initialized
        # in makeCacheMatrix() as the value NULL
        m <- x$getsolve()
        # If m is NOT still equal to NULL then we need to solve for the
        # matrix inverse
        if(!is.null(m)) {
                message("getting cached data")
                # the return value breaks us out of the function and
                # returns m since we already calculated it.
                return(m)
        }
        # If we've made it this far, then we know that the inverse
        # of the matrix has not been calculated. Therefore, we need
        # to use the get to get the value from makeCacheMatrix()
        data <- x$get()
        # call the solve function to get the inverse of the matrix
        m <- solve(data, ...)
        # cache the value with a setter
        x$setsolve(m)
        # return m 
        m
}

