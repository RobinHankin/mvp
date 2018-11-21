## This shows the skimpy package at its best
library("skimpy")
library("magic")

## A three-term polynomial:
a <- mvp(list(list(letters,letters,letters),list(1:26,26:1,rep(5,26)),1:3))

`rmvp` <- function(n,size=6,pow=6,symbols=letters){
    mvp(list(
        names=replicate(n,sample(symbols,size,replace=TRUE),simplify=FALSE),
        powers=replicate(n,sample(pow,size,replace=TRUE),simplify=FALSE),
        coeffs=sample(seq_len(n))
    ))
}

kahle  <- mvp(list(
    allnames     = split(cbind(letters,shift(letters)),rep(seq_len(26),each=2)),
    allpowers    = rep(list(1:2),26),
    coefficients = 1:26
))
