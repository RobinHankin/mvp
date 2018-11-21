`mvp` <- function(x){  # three-element list
  stopifnot(is_ok_mvp(x))
  out <- simplify(x[[1]],x[[2]],x[[3]])
  class(out) <- "mvp"   # this is the only time class() is set to "mvp"
  return(out)
}

`is_ok_mvp` <- function(l){
  stopifnot(is.list(l))
  stopifnot(length(l) == 3)


  stopifnot(unlist(lapply(l[[1]],is.character)))
  stopifnot(unlist(lapply(l[[2]],is.numeric)))
  stopifnot(is.numeric(l[[3]]))


  stopifnot(length(l[[1]])==length(l[[2]]))
  stopifnot(length(l[[2]])==length(l[[3]]))

  stopifnot(unlist(lapply(l[[1]],length)) == unlist(lapply(l[[2]],length)))

  return(TRUE)
}

  
`print.mvp` <-  function(x){
  print("(following is really an mvp object)")
  print(as.mpoly(x))
  cat("\n")
  print("(preceding was really an mvp object)")

}

`as.mvp` <- function(x){
  if(is.mvp(x)){
    return(x)
  } else if(is.mpoly(x)){
    return(mpoly_to_mvp(x))
  } else if(is.list(x)){
    return(mvp(x[[1]],x[[2]],x[[3]]))
  } else {
    stop("not recognised")
  }

}

`mpoly_to_mvp` <- function(m){
  mvp(list(
  names  = lapply(m,function(x){names(x[-length(x)])}),
  powers = lapply(m,function(x){(x[-length(x)])}),
  coeffs =  unlist(lapply(m,function(x){x[length(x)]}))
  ))
}



## as.mpoly() converts out1 into an mpoly object:
`as.mpoly.mvp` <- function(x,...){
    out <- list()
    for(i in seq_along(x[[1]])){
        out[[i]] <- c(`names<-`(x$power[[i]],x$names[[i]]),coef=x$coeffs[i],recursive=TRUE)
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
    

                 
    

   
