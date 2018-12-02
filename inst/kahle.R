library("mvp")

shift <- function(x,i=1){# from magic
  n <- length(x)
  return(x[c((n - i + 1):n, 1:(n - i))])
} 
 
kahle  <- mvp(
    vars     = split(cbind(letters,shift(letters)),rep(seq_len(26),each=2)),
    powers    = rep(list(1:2),26),
    coeffs = 1:26
)








