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

`print.mvp` <-  function(x, ...){
    cat("mvp object algebraically equal to\n")
    if(is.zero(x)){
        print(mp("0"),...)
    } else {
        print(as.mpoly(x), ...)
    }
    cat("\n")
}

`as.mvp` <- function(x,...){
  if(is.mvp(x)){
    return(x)
  } else if(is.mpoly(x)){
    return(mpoly_to_mvp(x))
  } else if(is.spray(x)){
    return(spray_to_mvp(x,...))
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

`spray_to_mvp` <- function(L,symbols=letters){
  I <- L$index
  mvp(
      vars   = sapply(seq_len(nrow(I)),function(i){symbols[which(I[i,] != 0)]},simplify=FALSE),
      powers = sapply(seq_len(nrow(I)),function(i){          I[i,I[i,] != 0 ]},simplify=FALSE),
      coeffs = L$value
      )
}

`mvp_to_spray` <- function(S){
    vS <- vars(S)
    pS <- powers(S)
    allvars <- sort(unique(c(vS,recursive=TRUE)))

    M <- matrix(0,length(powers(S)),length(allvars))
    for(i in seq_len(nrow(M))){
        v <- vS[[i]]
        p <- pS[[i]]

        M[i,sapply(v,function(x){which(x==allvars)})] <- p
    }
    spray::spray(M,coeffs(S))
}

`rmvp` <- function(n,size=6,pow=6,symbols=6){
  if(is.numeric(symbols)){symbols <- letters[seq_len(symbols)]}
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

`constant.numeric` <- function(x){numeric_to_mvp(x)}

`constant<-.mvp` <- function(x,value){
  wanted <- sapply(x$names,function(x){length(x)==0})
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

setGeneric("drop",function(x){standardGeneric("drop")})
`drop` <- function(x){UseMethod("drop")}
`drop` <- function(S){
    if((length(vars(S))==1) & (length(vars(S)[[1]])==0)){
        return(coeffs(S))
    } else {
        return(S)
    }
}

`subs` <- function(S, ..., drop=TRUE){
    sb <- unlist(list(...))
    jj <- mvp_substitute(S[[1]],S[[2]],S[[3]],names(sb),as.vector(sb))
    out <- mvp(jj[[1]],jj[[2]],jj[[3]])
    if(drop){
        return(drop(out))
    } else {
        return(out)
    }
}

`subsmvp` <- function(S, v, X){
  jj <- mvp_substitute_mvp(
      S[[1]],S[[2]],S[[3]],
      X[[1]],X[[2]],X[[3]],
      v)
    return(mvp(jj[[1]],jj[[2]],jj[[3]]))
}

`as.function.mvp` <- function(x, ...){
  function(...){subs(x, ...)}
}

`deriv.mvp` <- function(expr, v, ...){
  jj <- mvp_deriv(expr[[1]], expr[[2]], expr[[3]], v)
  return(mvp(jj[[1]],jj[[2]],jj[[3]]))
}

setGeneric("deriv")
setGeneric("aderiv",function(x){standardGeneric("aderiv")})
`aderiv` <- function(expr, n, ...){UseMethod("aderiv")}

`aderiv.mvp` <- function(expr, n, ...){
  deriv(expr, rep(names(n),n))
}

`invert` <- function(p,v){
  p <- as.mvp(p)
  vp <- vars(p)
  if(missing(v)){v <- unique(unlist(vp))}
  pp <- powers(p)
  for(i in seq_along(powers(p))){
    ## pp[[i]][vp[[i]] %in% v]  %<>% `*`(-1)
    pp[[i]][vp[[i]] %in% v] <- pp[[i]][vp[[i]] %in% v]
  }
  mvp(vp,pp,coeffs(p))
}

