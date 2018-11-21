library("skimpy")

allnames <- list(
    c("bing","y","bong","bung","bang","x","a","xxxxxxxx"),
    c("bing","bong","bang","x"),
    c("bing","bong","bung","bang","x"),
    c("bong","bung","bang","x"),
    letters[2:9],
    c('a','b','a'),
    letters[1:3],
    c('a','c','b'),
    c('t','a')
    
)

allpowers <- list(
    1:8,
    sample(4),
    sample(5),
    sample(4),
    sample(8),
    c(3,2,3),
    1:3,
    c(1,3,2),
    1:2
    )

coeffs = 1:9



out1 <- simplify(allnames=allnames,allpowers=allpowers,coefficients=coeffs)

allnames2      <- list(c("x","y"),"x", "y", c("y","x"), c("x","z"),c("z","x"), "t", "u",c("t","f"), letters[1:4])
allpowers2     <- list(c(1  , 1),  3,   4,  c(1,   1),  c(1,3),    c(3,1),      0,   0, c(0,5),      1:4)
coefficients2  <- c(        19,   2,   5,       5,        4,       -4,         100,  100, 3,         0)

out2 <- simplify(allnames=allnames2,allpowers=allpowers2,coefficients=coefficients2)


## (x+y)(x-y) == x^2-y^2:
out3 <- mvp_prod(
    list("x","y"),list(1,1),c(+1,+1),
    list("x","y"),list(1,1),c(+1,-1)
)

## (x+y)+(x-y)==2x:
out4 <- mvp_add(
    list("x","y"),list(1,1),c(+1,+1),
    list("x","y"),list(1,1),c(+1,-1)
)

## x*(x+y) == x^2+xy:
out5 <- mvp_prod(
    list("x"),list(1),c(+1),   # x
    list("x","y"),list(1,1),c(1,1) # x+y
)

out6 <- mvp_prod(
    list("x"),list(1),c(+1),  # x
    list("x","y"),list(1,1),c(1,1) # x+y
)

out7 <- mvp_prod(
           list("x","y"),list(1,1),c(1,3),
           list("x"),list(0),c(10)
           )


shift <- function(x,i=1){# from magic
  n <- length(x)
  return(x[c((n - i + 1):n, 1:(n - i))])
} 
 
kahle  <- simplify(
    allnames     = split(cbind(letters,shift(letters)),rep(seq_len(26),each=2)),
    allpowers    = rep(list(1:2),26),
    coefficients = 1:26
)

# kahle * kahle:
mvp_prod(kahle$names,kahle$power,kahle$coeffs,kahle$names,kahle$power,kahle$coeffs)

uu <- mvp_deriv(out1$names,out1$power,out1$coeffs,c("x","a","t"))
