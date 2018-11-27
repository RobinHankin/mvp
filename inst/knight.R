## Generating function for d-dimensional knight

library("skimpy")

`knight_skimpy` <- function(d,can_stay_still=FALSE){
  f <- function(d){
    n <- d * (d - 1)
    out <- matrix(0, n, d)
    out[cbind(rep(seq_len(n), each=2), c(t(which(diag(d)==0, arr.ind=TRUE))))] <- seq_len(2)
    out <- rbind(out, -out, `[<-`(out, out==1, -1),`[<-`(out, out==2, -2))
    out <- split(out,row(out))
    out <- lapply(out,function(x){names(x) <- letters[seq_along(x)] ; return(x)})
    list(
        lapply(out,function(x){names(x[x!=0])}),
        lapply(out,function(x){x[x!=0]})
    )
  }
  jj <- f(d)
  out <- mvp(
      jj[[1]],
      jj[[2]],
      rep(1,length(jj[[1]]))
  )
  if(can_stay_still){
    out <- 1+out
  }
  return(out)
}

knight_skimpy(4)  # four-dimensional knight
