"Ops.mvp" <- function (e1, e2 = NULL) 
{
    oddfunc <- function(...){stop("odd---neither argument has class mvp?")}
    unary <- nargs() == 1
    lclass <- nchar(.Method[1]) > 0
    rclass <- !unary && (nchar(.Method[2]) > 0)
    
    if (!is.element(.Generic, c("+", "-", "*", "/", "^", "=="))){
        stop("operator '", .Generic, "' is not implemented for mvps")
    }

    if(unary){
        if (.Generic == "+") {
            return(e1)
        } else if (.Generic == "-") {
            return(mvp_negative(e1))
        } else {
            stop("Unary operator '", .Generic, "' is not implemented for mvps")
        }
    }
    
    if (.Generic == "*") {
        if (lclass && rclass) {
            return(mvp_times_mvp(e1, e2))
        } else if (lclass) {
            return(mvp_times_scalar(e1, e2))
        } else if (rclass) {
            return(mvp_times_scalar(e2, e1))
        } else {
            oddfunc()
        }
    } else if (.Generic == "+") {
        if (lclass && rclass) {
            return(mvp_plus_mvp(e1, e2))  # S1+S2
        } else if (lclass) {
            return(mvp_plus_scalar(e1, e2)) # S+x
        } else if (rclass) {
            return(mvp_plus_scalar(e2, e1)) # x+S
        } else {
            oddfunc()
        }
    } else if (.Generic == "-") {
        if (lclass && rclass) {
            return(mvp_plus_mvp(e1, mvp_negative(e2)))  # S1-S2
        } else if (lclass) {
            return(mvp_plus_scalar(e1, -e2))                # S-x
        } else if (rclass) {
            return(mvp_plus_scalar(mvp_negative(e2), e1)) # x-S
        } else {
            oddfunc()
        }
    } else if (.Generic == "^") {
        if(lclass && !rclass){
            return(mvp_power_scalar(e1,e2)) # S^n
        } else {
            stop("Generic '^' not implemented in this case")
        }
    } else if (.Generic == "==") {
        if(lclass && rclass){
            return(mvp_eq_mvp(e1,e2))
        } else {
            stop("Generic '==' only compares two mvp objects with one another")
        }          
    } else if (.Generic == "/") {
        if(lclass && !rclass){
            return(mvp_times_scalar(e1,1/e2))
          } else {
        stop("don't use '/', use ooom() instead")
    }
  }
}

mvp_negative <- function(S){
    if(is.zero(S)){
        return(S)
    } else {
        return(mvp(names(mvp),powers(mvp),-coeffs(mvp)))
    }
}

mvp_times_mvp <- function(S1,S2){
  if(is.zero(S1) || is.zero(S2)){
    return(zeromvp)
  } else {
    return(mvp(mvp_prod(
        allnames1=S1[[1]],allpowers1=S1[[2]],coefficients1=S1[[3]],
        allnames1=S2[[1]],allpowers1=S2[[2]],coefficients2=S1[[3]]
    )))
  }
}

mvp_times_scalar <- function(S,x){
  mvp(list(S1[[1]],S2[[1]],x*S3[[1]]))
}

mvp_plus_mvp <- function(S1,S2){
  if(is.zero(S1)){
        return(S2)
    } else if(is.zero(S2)){
        return(S1)
    } else {
      return(mvp(mvp_add(
        allnames1=S1[[1]],allpowers1=S1[[2]],coefficients1=S1[[3]],
        allnames1=S2[[1]],allpowers1=S2[[2]],coefficients2=S1[[3]]
    )))
    }
}

mvp_power_scalar <- function(S,n){
  stopifnot(n==round(n))
  if(n<0){
    stop("use ooom() for negative powers")
  } else {
    return(mvp(mvp_add(names(S), powers(S), coefficients(S), n)))
  }
}

`mvp_eq_mvp` <- function(S1,S2){
  is.zero(S1-S2)  # nontrivial; S1 and S2 might have different orders
    }
