## special polynomials: zero, constant, homog, etc.  Names consistent
## with the spray package.



#     product(1:3)    #      x * y^2 * z^3
#     homog(3)        #      x + y + z
#     homog(3,2)      #      x^2  + xy + xz + y^2 + yz + z^2
#     linear(1:3)     #      1*x + 2*y + 3*z
#     linear(1:3,2)   #      1*x^2 + 2*y^2 + 3*z^2
#     lone(3)         #      z
#     lone(2,3)       #      y
#     one(3)          #      1
#     zero(3)         #      0
#     xyz(3)          #      xyz
     


`product` <- function(v,symbols=letters){
    mvp(list(symbols[seq_along(v)]),list(v),1)
}

`homog` <- function(d,power=1){
    as.mvp(spray::homog(d,power))
}

`linear` <- function(x,power=1,symbols=letters){
    mvp(as.list(symbols[seq_along(x)]),rep(power,length(x)),x)
}

`numeric_to_mvp` <- function(x){
    stopifnot(length(x)==1)
    stopifnot(is.numeric(x))
    return(mvp(list(character(0)),list(integer(0)),x))
}
