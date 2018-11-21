`mvp` <- function(x){  # three-element list
  stopifnot(is_ok_mvp(x))
  out <- simplify(x[[1]],x[[2]],x[[3]])
  class(out) <- "mvp"   # this is the only time class() is set to "mvp"
  return(out)
}

`is.mvp` <- function(x){inherits(x,"mvp")}

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
    cat("mvp object algebraically equal to\n")
    print(as.mpoly(x))
    cat("\n")
}

`as.mvp` <- function(x){
  if(is.mvp(x)){
    return(x)
  } else if(is.mpoly(x)){
    return(mpoly_to_mvp(x))
  } else if(is.list(x)){
    return(mvp(x))
  } else {
    stop("not recognised")
  }
}

`mpoly_to_mvp` <- function(m){
  mvp(list(
  names  = lapply(m,function(x){names(x[names(x)!="coef"])}),
  powers = lapply(m, function(x){as.vector(x[names(x)!="coef"])}),
  coeffs =  unlist(lapply(m,function(x){x["coef"]}))
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

    
