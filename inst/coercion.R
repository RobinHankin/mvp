library("spray")
library("mpoly")
library("mvp")
library("microbenchmark")


`as.mvp.spray` <- function(x){spray_to_mvp(x)}
`spray_to_mvp` <- function(L,symbols=letters){
  I <- index(L)
  mvp(
      vars   = sapply(seq_len(nrow(I)),function(i){symbols[which(I[i,] != 0)]},simplify=FALSE),
      powers = sapply(seq_len(nrow(I)),function(i){          I[i,I[i,] != 0 ]},simplify=FALSE),
      coeffs = value(L)
      )
}

`mvp_to_spray` <- function(S){
    cons <- mvp::constant(S)
    mvp::constant(S) <- 0
    vS <- vars(S)
    pS <- powers(S)
    av <- allvars(S)

    M <- matrix(0,length(powers(S)),length(av))
    for(i in seq_len(nrow(M))){
        v <- vS[[i]]
        p <- pS[[i]]

        M[i,sapply(v,function(x){which(x==av)})] <- p
    }

    if(cons==0){
      jj <- disordR::elements(coeffs(S))
    } else {
      M <- rbind(M,0)
      jj <- c(disordR::elements(coeffs(S)),cons)
    }
    out <- list(M,jj)

    class(out) <- "spray"
    return(out)
}
