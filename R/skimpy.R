`mvp` <- function(vars,powers,coeffs){  # three-element list
  stopifnot(is_ok_mvp(vars,powers,coeffs))
  out <- simplify(vars,powers,coeffs)  # simplify() is defined in
                                       # RcppExports.R; it returns a
                                       # list
  class(out) <- "mvp"   # this is the only time class() is set to "mvp"
  return(out)
}

vars <- function(x)  {disord(x[[1]],hashcal(x))}
powers <- function(x){disord(x[[2]],hashcal(x))}
`coeffs` <- function(x){UseMethod("coeffs")}
`coeffs.mvp` <- function(x){disord(x[[3]],hashcal(x))}

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

`allvars` <- function(x){sort(unique(c(elements(vars(x)),recursive=TRUE)))}

`is.zero` <- function(x){UseMethod("is.zero")}
`is.zero.mvp` <- function(x){
    length(vars(x))==0
}

`print.mvp` <-  function(x, ...){
    cat("mvp object algebraically equal to\n")
    if(is.zero(x)){
        out <- mp("0")
    } else {
        out <- as.mpoly(x)
    }
    out <- print(out,silent=TRUE)  # should use print.mpoly()
    cat(paste(strwrap(out, getOption("width")), collapse="\n"))
    cat("\n")
    return(x)
}

setGeneric("as.mvp",function(x){standardGeneric("as.mvp")})
`as.mvp` <- function(x){UseMethod("as.mvp",x)}

`as.mvp.mvp` <- function(x){x}
`as.mvp.mpoly` <- function(x){mpoly_to_mvp(x)}
## as.mvp.freealg() defined in inst/freealg_mvp.R
`as.mvp.character` <- function(x){mpoly_to_mvp(mp(x))}
`as.mvp.list` <- function(x){mvp(vars=x$names,powers=x$power,coeffs=x$coeffs)}
`as.mvp.numeric` <- function(x){numeric_to_mvp(x)}

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

`rmvp` <- function(n=7,size=6,pow=6,symbols=6){
  if(is.numeric(symbols)){symbols <- letters[seq_len(symbols)]}
    mvp(
        vars   = replicate(n,sample(symbols,size,replace=TRUE),simplify=FALSE),
        powers = replicate(n,sample(pow,size,replace=TRUE),simplify=FALSE),
        coeffs = sample(seq_len(n))
    )
}

`coeffs<-` <- function(x,value){UseMethod("coeffs<-")}
`coeffs<-.mvp` <- function(x,value){
  jj <- coeffs(x)
  if(is.disord(value)){
    stopifnot(consistent(vars(x),value))
    stopifnot(consistent(powers(x),value))
    jj <- value
  } else {
    jj[] <- value  # the meat
  }
  mvp(vars(x),powers(x),jj)
}

`constant` <- function(x){UseMethod("constant")}
`constant<-` <- function(x, value){UseMethod("constant<-")}

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
  if(any(wanted)){  # if there is constant term present in x...
    x$coeffs[wanted] <- value  # ... change its value
    return(mvp(vars(x),powers(x),coeffs(x)))
  } else {  # no constant term in x... 
    return(mvp(     # ...so an extra (constant) term must be added:
    c(elements(vars(x)),list(character(0))), # to the variables
    c(elements(powers(x)),list(integer(0))), # and the powers
    c(elements(coeffs(x)),value))            # and coeffs (with the correct value)
    )
  }
}

`is.constant` <- function(x){length(allvars(x))==0}

setGeneric("lose",function(x){standardGeneric("lose")})
`lose` <- function(x){UseMethod("lose",x)}
`lose.mvp` <- function(x){
    if(is.zero(x)){
      return(0)
    } else if((length(vars(x))==1) & (length(vars(x)[[1]])==0)){
        out <- coeffs(x)
        attributes(out) <- NULL
        return(unclass(out))
    } else {  # er, nothing to lose
      return(x)
    }
}

`subs` <- function(S,...,lose=TRUE){
  sb <- list(...)
  v <- names(sb)

  out <- S
  for(i in seq_along(sb)){
    out <- subsmvp(out,v[i],as.mvp(sb[[i]]))
  }
  if(lose){
    return(lose(out))
  } else {
    return(out)
  }
}

`subsy` <- function(S, ..., lose=TRUE){
    sb <- unlist(list(...))
    jj <- mvp_substitute(S[[1]],S[[2]],S[[3]],names(sb),as.vector(sb))
    out <- mvp(jj[[1]],jj[[2]],jj[[3]])
    if(lose){
        return(lose(out))
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

`subvec` <- function(S, ...){
  jj <- list(...)
    if(is.matrix(jj[[1]])){
      M <- jj[[1]]
    } else { 
      M <- do.call("cbind",jj)
    }
   
    if(is.null(colnames(M))){stop("Null symbols given: you need to name the ellipsis arguments or pass a matrix with column names")}
    out <- mvp_vectorised_substitute(S[[1]], S[[2]], S[[3]], as.double(c(M)), nrow(M), ncol(M), colnames(M))
    names(out) <- rownames(M)
    return(out)
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
`aderiv` <- function(expr, ...){UseMethod("aderiv")}

`aderiv.mvp` <- function(expr, ...){
  n <- unlist(list(...))
  deriv(expr, rep(names(n),n))
}

`invert` <- function(p,v){
  p <- as.mvp(p)
  vp <- vars(p)
  if(missing(v)){v <- unique(unlist(elements(vp)))}
  pp <- powers(p)
  for(i in seq_along(powers(p))){
    ## pp[[i]][vp[[i]] %in% v]  %<>% `*`(-1)
    pp[[i]][vp[[i]] %in% v] <- -pp[[i]][vp[[i]] %in% v]
  }
  mvp(vp,pp,coeffs(p))
}

`kahle`  <- function(n=26,r=1,p=1,coeffs=1,symbols=letters){
  if(n > length(symbols)){stop("not enough symbols")}
  symbols <- symbols[seq_len(n)]
  p <- rep(p,length=r)
  jj <- circulant(symbols)[seq_len(r),]
  jj <- split(jj,rep(seq_len(n),each=r))

  coeffs=rep(coeffs,length=n)

  mvp(
      vars   = jj,
      powers = rep(list(p),n),
      coeffs = coeffs
  )
}

`horner` <- function(P, v) {  # inspired by Rosettacode
  P <- as.mvp(P)
  Reduce(v, right=TRUE, f=function(a,b){b*P + a})
}

`ooom` <- function(P,n){
  P <- as.mvp(P)
  stopifnot(constant(P)==0)
  stopifnot(n>=0)
  if(n==0){
    return(as.mvp("1"))
  } else {
    return(horner(P,rep(1,n+1)))
  }
}

`trunc` <- function(S,n){
    jj <- mvp_taylor_allvars(allnames=S[[1]],allpowers=S[[2]],coefficients=S[[3]],n)
    return(mvp(jj[[1]],jj[[2]],jj[[3]]))
}

`trunc1` <- function(S,...){
  sb <- list(...)
  v <- names(sb)
  for(i in seq_along(sb)){
    jj <- mvp_taylor_onevar(allnames=S[[1]],allpowers=S[[2]],coefficients=S[[3]], v[i], sb[[i]])
    S <- mvp(jj[[1]],jj[[2]],jj[[3]])
  }
  return(S)
}

`truncall` <- function(S,n){
  a <- allvars(S)
  v <- rep(n,length(a))
  names(v) <- a
  do.call(trunc1,c(list(S),as.list(v)))
}

`onevarpow` <- function(S,...){
  sb <- list(...)
  v <- names(sb)
  for(i in seq_along(sb)){
    jj <- mvp_taylor_onepower_onevar(allnames=S[[1]],allpowers=S[[2]],coefficients=S[[3]], v[i],sb[[i]])
    S <- mvp(jj[[1]],jj[[2]],jj[[3]])
  }
  return(S)
}

`series` <- function(S,v,showsymb=TRUE){
  o <-   mvp_to_series(allnames=S[[1]],allpowers=S[[2]],coefficients=S[[3]], as.character(v))
  o[[1]] <- lapply(o[[1]],as.mvp)  # o[[1]] %<>% lapply(as.mvp)
  if(showsymb){v <- sub("^(.*)_m_(.*)", "(\\1-\\2)", v, perl=TRUE)}
  o <- c(o,variablename=v)  # add the variable
  class(o) <- "series"
  return(o)
}

`print.series` <- function(x, ...){
  out <- ""
  for(i in seq_along(x[[1]])){
    if(i>1){out <- paste(out, " + ")}
    out <- paste(
        out, x$variablename, "^", x$varpower[i],
        getOption("mvp_mult_symbol"),
        "(",
        capture.output(print(mpoly::as.mpoly(x[[1]][[i]]))),
        ")",
        sep="")
  }
  cat(strsplit(out,split=" ")[[1]],fill=TRUE)
  cat("\n")
  return(invisible(out))
}

`namechanger` <- function(x,old,new){
  sub(
      pattern = paste("^", old, "$", sep=""),
      replacement = new,
      x)
}

`varchange` <- function(S, ...){
  sb <- list(...)
  for(i in seq_along(sb)){
    S[[1]] <- lapply(S[[1]], function(x){namechanger(x,names(sb)[i],sb[[i]])})
  }
  return(mvp(S[[1]],S[[2]],S[[3]]))
}

`varchange_formal` <- function(S,old,new){
  stopifnot(length(old) == length(new))
  for(i in seq_along(old)){
    S[[1]] <- lapply(S[[1]], function(x){namechanger(x,old[i],new[i])})
  }
  return(mvp(S[[1]],S[[2]],S[[3]]))
}

`taylor` <- function(S,vx,va,debug=FALSE){# basically: p %>% subs(x="x_m_a + a") %>% series("x_m_a")
    ## trying to do: series(subs(S,x="x_m_a + a"), "x_m_a")

    string <- paste('series(subs(S,',vx,'="',vx,"_m_", va, " + ", va, '"), "',vx,"_m_",va,'")',sep="")

    if(debug){
        return(noquote(string))
    } else {
        return(eval(parse(text = string)))
    }
}

`nterms` <- function(object){length(object[[1]])}

`summary.mvp` <- function(object, ...){
  out <- list(
      no.of.terms         = length(object[[1]]),
      no.of.symbols       = length(unique(c(object[[1]],recursive=TRUE))),
      highest.power       = max(c(object[[2]],recursive=TRUE)),
      longest.term        = max(unlist(lapply(object[[1]],length))),
      has.negative.powers = any(c(object[[2]],recursive=TRUE) < 0),
      constant            = constant(object)
      )
    class(out) <- "summary.mvp"
    return(out)
}

`print.summary.mvp` <- function(x, ...){
  cat("mvp object.\n")
  cat("Number of terms:"           , x[[1]],"\n") 
  cat("Number of distinct symbols:", x[[2]],"\n") 
  cat("Highest power:"             , x[[3]],"\n") 
  cat("Longest term: "             , x[[4]],"\n")
  cat("Has negative powers: "      , x[[5]],"\n")
  cat("Constant: "                 , x[[6]],"\n")
}

`rtypical` <- function(object,n=3){
  K <- constant(object)
  constant(object) <- 0
  wanted <- sample(nterms(object),n,replace=FALSE)
  K + mvp(object[[1]][wanted],object[[2]][wanted],object[[3]][wanted])
}

