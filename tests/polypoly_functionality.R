library("mvp")
library("mpoly")
`is.polypoly` <- function(x){inherits(x,"polypoly")}
`mvp_to_polypoly` <- function(X,focalvar){
    print('a')
    jj <- mvp_to_polypoly_lowlevel(vars(X),powers(X),coeffs(X),focalvar)
    print('b')
    polypoly(jj[[1]],jj[[2]],focalvar)
}

`is_ok_polypoly` <- function(powers,polycoeffs,focalvar){
    if ((length(powers) == 0) & (length(polycoeffs)==0)){ return(TRUE)}
    stopifnot(is.numeric(powers))
    stopifnot(is.vector(powers))
    stopifnot(is.character(focalvar))
    stopifnot(all(powers == round(powers)))
    return(TRUE)
}

`polypoly` <- function(powers,polycoeffs,focalvar){  # pure R
    storage.mode(powers) <- "integer"
    stopifnot(is_ok_polypoly(powers,polycoeffs,focalvar))
    polycoeffs  %<>% lapply(function(x){mvp(x[[1]],x[[2]],x[[3]])})
    out <- list(powers,polycoeffs,focalvar)
    class(out) <- "polypoly"  # the only place class polypoly is set
    return(out)
}

print.polypoly <- function(x){
    n <- length(x[[1]])
    v <- x[[3]]
    out <- ""
    for(i in seq_len(n-1)){
        out %<>% paste(v,"^",x[[1]][i],"[",print(as.mpoly(x[[2]][i][[1]]),"] + "))
    }
    out %<>% paste(v,"^",x[[1]][i],"[",print(as.mpoly(x[[2]][i][[1]]),"]\n"))
    cat(out)
    invisible(x)
}
    
X <- as.mvp("a^6 b^7 + 44*a^5     +   te*a^2*u^2 + te*9    +   te*q^56+ te^66*p*a^6")
jj_old <- mvp_to_polypoly_lowlevel(vars(X),powers(X),coeffs(X),'te')
jj     <- mvp_to_polypoly(X,'te')
