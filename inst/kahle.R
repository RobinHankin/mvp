library("mvp")
library("magic")

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


# 
