## This file follows the structure of aaa.R in the free group package.

## Define some checker functions, and call them at the end.  They
## should all return TRUE if the package works, and stop with error if
## a test is failed.  Function checker1() has one argument, checker2()
## two, and checker3() has three.  

library("mvp")

checker1 <- function(x){
  stopifnot(x==x)

  stopifnot(x == x + constant(0))
  stopifnot(x == -(-x))
  stopifnot(x == +(+x))

  stopifnot(x+x-x == x)

  stopifnot(is.zero(x-x))

  stopifnot(0*x == constant(0))
  stopifnot(1*x == x)
  stopifnot(2*x == x+x)
  stopifnot(3*x == x+x+x)
  stopifnot(4*x == x+x+x+x)
  stopifnot(5*x == x+x+x+x+x)
  stopifnot(6*x == x+x+x+x+x+x)

  stopifnot(x^0 == constant(1))
  stopifnot(x^1 == x)
  stopifnot(x^2 == x*x)
  stopifnot(x^3 == x*x*x)
  stopifnot(x^4 == x*x*x*x)
  
  return(TRUE)
}


checker2 <- function(x,y){
  stopifnot(x == -y+x+y)
  stopifnot(x+y == x-(-y))

  stopifnot(x+y == y+x)

  stopifnot((-x)*y == -(x*y))
  stopifnot(x*(-y) == -(x*y))

              
  return(TRUE)
}

checker3 <- function(x,y,z){
  stopifnot(x+(y+z) == (x+y)+z) # associativity
  stopifnot(x*(y*z) == (x*y)*z) # associativity

  stopifnot(x*(y+z) == x*y + x*z)
  return(TRUE)
}


for(i in 1:10){
    x <- rmvp(5)
    y <- rmvp(5)
    z <- rmvp(5)
    
    checker1(x)
    checker2(x,y)
    checker3(x,y,z)
}


