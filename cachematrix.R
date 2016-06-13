## Caching the inverse of a matrix allows for in some cases a speedyer result.
## as upposed to continualy computing the inverse
## pair of functions that make an object that stores a matrix and caches the inverse

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(z) {
		x <- z
		inv <- NULL
	}
	get <- function () x
	setINverse <- function (inverse) inv <- inverse
	getInverse <- finction () inv
	list( set = set,
	      get = get, 
	      setInverse = setInverse,
	      getInverse = getInverse)
	
}


## computes inverse of matrix 
## the source of that matrix is the makeCacheMatrix
## if the inverse was calculated and the matrix didnt change then the inverse is taken fromt he cache

cacheSolve <- function(x, ...) {
	##ReturnaMatrixthat is the inverseof 'x'
	
	inv <- x$getInverse()
	if (!is.null(inv)) {
		message ("cached data")
		return(inv)
	}
	mat <- x$get()
	inv <- solve(mat, ...)
	x$setInverse(inv)
	inv
}


