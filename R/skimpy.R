`mvp` <- function(vars,powers,coeffs){  # three-element list
  stopifnot(is_ok_mvp(vars,powers,coeffs))
  out <- simplify(vars,powers,coeffs)  # simplify() is defined in
                                       # RcppExports.R; it returns a
                                       # list
  class(out) <- "mvp"   # this is the only time class() is set to "mvp"
  return(out)
}

vars <- function(x){x[[1]]}
powers <- function(x){x[[2]]}
coeffs <- function(x){x[[3]]}  # accessor methods end here

`is.mvp` <- function(x){inherits(x,"mvp")}

`is_ok_mvp` <- function(vars,powers,coeffs){
    if( (length(vars)==0) & (length(powers)==0) && (length(coeffs)==0)){
        return(TRUE)  # zero polynomial
    }
  stopifnot(unlist(lapply(vars,is.character)))
  stopifnot(unlist(lapply(powers,is.numeric)))
  stopifnot(is.numeric(coeffs))

  stopifnot(length(vars)==length(powers))
  stopifnot(length(powers)==length(coeffs))

  stopifnot(unlist(lapply(vars,length)) == unlist(lapply(powers,length)))

  return(TRUE)
}

`is.zero` <- function(x){
    length(vars(x))==0
}

`print.mvp` <-  function(x){
    cat("mvp object algebraically equal to\n")
    if(is.zero(x)){
        print(mp("0"))
    } else {
        print(as.mpoly(x))
    }
    cat("\n")
}

`as.mvp` <- function(x){
  if(is.mvp(x)){
    return(x)
  } else if(is.mpoly(x)){
    return(mpoly_to_mvp(x))
  } else if(is.character(x)){
    return(mpoly_to_mvp(mp(x)))
  } else if(is.list(x)){
    return(mvp(x))
  } else if(is.numeric(x)){
    return(numeric_to_mvp(x))
  } else {
    stop("not recognised")
  }
}

`mpoly_to_mvp` <- function(m){
  mvp(
  vars   = lapply(m,function(x){names(x[names(x)!="coef"])}),
  powers = lapply(m, function(x){as.vector(x[names(x)!="coef"])}),
  coeffs =  unlist(lapply(m,function(x){x["coef"]}))
  )
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

`rmvp` <- function(n,size=6,pow=6,symbols=letters){
    mvp(
        vars   = replicate(n,sample(symbols,size,replace=TRUE),simplify=FALSE),
        powers = replicate(n,sample(pow,size,replace=TRUE),simplify=FALSE),
        coeffs = sample(seq_len(n))
    )
}


"constant" <- function(x){UseMethod("constant")}
"constant<-" <- function(x, value){UseMethod("constant<-")}

`constant.mvp` <- function(x){
  wanted <- sapply(x$names,function(x){length(x)==0})
  if(any(wanted)){
    out <- x$coeffs[wanted]
  } else {
    out <- 0
  }
  return(out)
}

`constant<-.mvp` <- function(x,value){
  wanted <- sapply(a$names,function(x){length(x)==0})
  if(any(wanted)){
    x$coeffs[wanted] <- value
  } else {  # no constant term
    x <- mvp(
        vars = c(x$names,list(character(0))),
        powers = c(x$power,list(integer(0))),
        coeffs=c(x$coeffs,value)
    )
  }
  return(x)
}

`as.function.mvp` <- function(p){
  function(...){subs(p,...)}
}
