`as_coeffs` <- function(v,h){  # v is a vector but it needs a hash key 'h'
    out <- unclass(v)
    attributes(out) <- list(sha1=h)
    class(out) <- "mvp_coeffs"
    return(out)
}

`is.coeffs` <- function(x){inherits(x,"mvp_coeffs")}
`consistent` <- function(x,y){identical(attributes(x)$sha1, attributes(y)$sha1)}
`%~%` <- function(x,y){consistent(x,y)}

`print.mvp_coeffs` <- function(x,...){
    out <- x
    cat("coeffs object with hash ", attributes(x)$sha1, " and elements \n")
    attributes(x) <- NULL
    print(unclass(x))
    return(invisible(out))
}

`Ops.mvp_coeffs` <- function (e1, e2 = NULL) 
{
    oddfunc <- function(...){stop("odd---neither argument has class mvp?")}
    unary <- nargs() == 1
    lclass <- nchar(.Method[1]) > 0
    rclass <- !unary && (nchar(.Method[2]) > 0)

    if(unary){
        if (.Generic == "+") {
            return(e1)
        } else if (.Generic == "-") {
            return(as_coeffs(-unclass(e1),hash(e1)))
        } else {
            stop("Unary operator '", .Generic, "' is not implemented for mvp_coeffs")
        }
    }

    if (!is.element(.Generic, c("+", "-", "*", "/", "^","%%", "==", "!=",">",">=","<","<="))){
        stop("operator '", .Generic, "' is not implemented for coeffs")
    }

    if(!lclass & rclass){
        stopifnot(length(e1)==1)  # e1 is a numeric and e2 is a coeffs object
        h <- attributes(e2)$sha1
    } else if(lclass & !rclass){
        stopifnot(length(e2)==1)  # e2 is a numeric and e1 is a coeffs object
        h <- attributes(e1)$sha1
    } else if(lclass & rclass){ # both objects are a coeffs object, hash codes must match
        stopifnot(identical(hash(e1),hash(e2)))
        h <- attributes(e2)$sha1
    } else {
        stop("this cannot happen")
    }
    
    if        (.Generic == "*" ) { return(as_coeffs(unclass(e1) *  unclass(e2),h))
    } else if (.Generic == "+" ) { return(as_coeffs(unclass(e1) +  unclass(e2),h))
    } else if (.Generic == "-" ) { return(as_coeffs(unclass(e1) -  unclass(e2),h))
    } else if (.Generic == "/" ) { return(as_coeffs(unclass(e1) /  unclass(e2),h))
    } else if (.Generic == "^" ) { return(as_coeffs(unclass(e1) ^  unclass(e2),h))
    } else if (.Generic == "%%") { return(as_coeffs(unclass(e1) %% unclass(e2),h))
    } else if (.Generic == "==") { return(as_coeffs(unclass(e1) == unclass(e2),h))
    } else if (.Generic == "!=") { return(as_coeffs(unclass(e1) != unclass(e2),h))
    } else if (.Generic == ">" ) { return(as_coeffs(unclass(e1) >  unclass(e2),h))
    } else if (.Generic == ">=") { return(as_coeffs(unclass(e1) >= unclass(e2),h))
    } else if (.Generic == "<" ) { return(as_coeffs(unclass(e1) <  unclass(e2),h))
    } else if (.Generic == "<=") { return(as_coeffs(unclass(e1) <= unclass(e2),h))
    } else {stop("this cannot happen")}   
}

`[.mvp_coeffs` <- function(x,i,j,drop=TRUE,...){
      stop("extractor methods do not make sense for coeffs objects")
}

`[<-.mvp_coeffs` <- function(x,i,j,value){ # x[i] <- value; coeffs(a)[coeffs(a)>4] <- 4

    h <- attributes(x)$sha1
    if(is.coeffs(value)){
      if(!(x %~% value)){stop("inconsistent coeffs objects (different sha1 hash)")}
    } else {
      if(length(value) != 1){stop("replacement not of length 1")}
    }

    if(!(x %~% i)){stop("inconsistent coeffs objects (different sha1 hash)")}
    if(!missing(j)){stop("too many arguments to `[<-`()")}

    x <- unclass(x)
    value <- unclass(value)
    i <- unclass(i)
    x[i] <- value    

    return(as_coeffs(x,h))
}
