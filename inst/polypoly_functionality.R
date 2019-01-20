library("mvp")

`is.polypoly` <- function(x){inherits(x,"polypoly")}
`mvp_to_polypoly` <- function(X,v){
    print('a')
    jj <- mvp_to_polypoly_lowlevel(vars(X),powers(X),coeffs(X),v)
    print('b')
    polypoly(jj[[1]],jj[[2]])
}

`is_ok_polypoly` <- function(powers,polycoeffs){
    if ((length(powers) == 0) & (length(polycoeffs)==0)){ return(TRUE)}
    stopifnot(is.numeric(powers))
    stopifnot(is.vector(powers))
    stopifnot(all(powers == round(powers)))
    return(TRUE)
}

`polypoly` <- function(powers,polycoeffs){  # pure R
    storage.mode(powers) <- "integer"
    stopifnot(is_ok_polypoly(powers,polycoeffs))
    polycoeffs  %<>% lapply(function(x){mvp(x[[1]],x[[2]],x[[3]])})
    out <- list(powers,polycoeffs)
    class(out) <- "polypoly"
    return(out)
}

print.polypoly <- function(x){
    print("PRINT METHOD NOT IMPLEMENTED")
    print(unclass(x))
    x
}
    
X <- as.mvp("a^6 b^7 + 44*a^5     +   te*a^2*u^2 + te*9    +   te*q^56+ te^66*p*a^6")
jj_old <- mvp_to_polypoly_lowlevel(vars(X),powers(X),coeffs(X),'te')
jj     <- mvp_to_polypoly(X,'te')
