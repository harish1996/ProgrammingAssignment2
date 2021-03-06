makeCacheMatrix <- function( x = matrix() )
{
	inv <- NULL
	
	set_matrix <- function(y){
		x <<- y
		inv <<- NULL
	}
	get_matrix <- function(){
		x
	}
	set_inverse <- function( inverse ){
		inv <<- inverse
	}
	get_inverse <- function() {
		inv
	}

	list( set=set_matrix, get=get_matrix, set_inverse = set_inverse, get_inverse = get_inverse )
}

cacheSolve <- function(x,...){
	inv <- x$get_inverse()
	if( !is.null(inv) ){
		message("cached message")
		return(inv)
	}

	mat <- x$get()
	inv <- solve(mat)
	x$set_inverse(inv)
	inv
}




