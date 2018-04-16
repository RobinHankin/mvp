
## as.mpoly() converts out1 into an mpoly object:
`as.mpoly` <- function(X){
    out <- list()
    for(i in seq_along(X[[1]])){
        out[[i]] <- c(`names<-`(X$power[[i]],X$names[[i]]),coef=X$coeffs[i],recursive=TRUE)
    }
    class(out) <- "mpoly"
    return(out)
}

## as.mvp() converts an mpoly object into a mvp object:
`as.mvp` <- function(X){
    out <- list()
    for(i in seq_along(X[[1]])){
        jj <- X[[i]]
        jj <- jj[seq_len(length(jj)-1)]

        out$names[[i]] <- names(jj)
        out$powers[[i]] <- unname(jj)
        out$coeffs[i] <- unname(jj[length(jj)])
    }

    class(out) <- "mvp"
    return(out)
}
    

                 
    

   
