`mvp` <- function(const,vars,powers,coeffs){  # three-element list
  stopifnot(is_ok_mvp(const,vars,powers,coeffs))
  out <- c(const,simplify(vars,powers,coeffs))  # simplify() is defined in
                                       # RcppExports.R; it returns a
                                       # three-element list
  class(out) <- "mvp"   # this is the only time class() is set to "mvp"
  return(out)
}

const  <- function(x){x[[1]]}
vars   <- function(x){x[[2]]}
powers <- function(x){x[[3]]}
coeffs <- function(x){x[[4]]}  # accessor methods end here

`is.mvp` <- function(x){inherits(x,"mvp")}

`is_ok_mvp` <- function(const,vars,powers,coeffs){
    stopifnot(is.numeric(const))
    stopifnot(length(const)==1)

    if( (length(vars)==0) & (length(powers)==0) && (length(coeffs)==0)){
        return(TRUE)  # constant polynomial
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
    (const(x)==0) & (length(vars(x))==0)
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
  const  = unlist(lapply(m, function(x){if(length(x)==1){return(x)}else{return(NULL)}})),
  vars   = lapply(m,function(x){names(x[names(x)!="coef"])}),
  powers = lapply(m, function(x){as.vector(x[names(x)!="coef"])}),
  coeffs =  unlist(lapply(m,function(x){x["coef"]}))
  )
}

## as.mpoly() converts an mvp into an mpoly object:
`as.mpoly.mvp` <- function(x,...){
    out <- list()
    for(i in seq_along(vars(x))){
        out[[i]] <- c(`names<-`(power(x)[[i]],vars(x)[[i]]),coeffs(x)[i],recursive=TRUE)
    }
    class(out) <- "mpoly"
    return(out+const(x))
}    

`rmvp` <- function(n,size=6,pow=6,symbols=letters){
    mvp(
        const  = sample(seq_len(n),1),
        vars   = replicate(n,sample(symbols,size,replace=TRUE),simplify=FALSE),
        powers = replicate(n,sample(pow,size,replace=TRUE),simplify=FALSE),
        coeffs = sample(seq_len(n))
    )
}

