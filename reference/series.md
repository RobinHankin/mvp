# Decomposition of multivariate polynomials by powers

Power series of multivariate polynomials, in various forms

## Usage

``` r
trunc(S,n)
truncall(S,n)
trunc1(S,...)
series(S,v,showsymb=TRUE)
# S3 method for class 'series'
print(x,...)
onevarpow(S,...)
taylor(S,vx,va,debug=FALSE)
mvp_taylor_onevar(allnames,allpowers,coefficients, v, n)
mvp_taylor_allvars(allnames,allpowers,coefficients, n)
mvp_taylor_onepower_onevar(allnames, allpowers, coefficients, v, n)
mvp_to_series(allnames, allpowers, coefficients, v)
```

## Arguments

- S:

  Object of class `mvp`

- n:

  Non-negative integer specifying highest order to be retained

- v:

  Variable to take Taylor series with respect to. If missing, total
  power of each term is used (except for `series()` where it is
  mandatory)

- x,...:

  Object of class `series` and further arguments, passed to the print
  method; in `trunc1()` a list of variables to truncate

- showsymb:

  In function `series()`, Boolean, with default `TRUE` meaning to
  substitute variables like `x_m_foo` with `(x-foo)` for readability
  reasons; see the vignette for a discussion

- vx,va,debug:

  In function `taylor()`, names of variables to take series with respect
  to; and a Boolean with default `FALSE` meaning to return the mvp and
  `TRUE` meaning to return the string that is passed to
  [`eval()`](https://rdrr.io/r/base/eval.html)

- allnames,allpowers,coefficients:

  Components of `mvp` objects

## Details

Function `onevarpow()` returns just the terms in which the symbols
corresponding to the named arguments have powers equal to the arguments'
powers. Thus:

     onevarpow(as.mvp("x*y*z + 3*x*y^2 + 7*x*y^2*z^6 + x*y^3"),x=1,y=2)
    mvp object algebraically equal to
    3  +  7 z^6

Above, we see that only the terms with `x^1*y^2` have been extracted,
corresponding to arguments `x=1,y=2`.

Function `series()` returns a power series expansion of powers of
variable `v`. The value returned is a list of three elements named
`mvp`, `varpower`, and `variablename`. The first element is a list of
`mvp` objects and the second is an integer vector of powers of variable
`v` (element `variablename` is a character string holding the variable
name, argument `v`).

Function `trunc(S,n)` returns the terms of `S` with the sum of the
powers of the variables \\\leq n\\. Alternatively, it discards all terms
with total power \\\>n\\.

Function `trunc1()` is similar to `trunc()`. It takes a `mvp` object and
an arbitrary number of named arguments, with names corresponding to
variables and their values corresponding to the highest power in that
variable to be retained. Thus `trunc1(S,x=2,y=4)` will discard any term
with variable `x` raised to the power 3 or above, and also any term with
variable `y` raised to the power 5 or above. The highest power of `x`
will be 2 and the highest power of `y` will be 4.

Function `truncall(S,n)` discards any term of `S` with any variable
raised to a power greater than `n`.

Function `series()` returns an object of class `series`; the print
method for `series` objects is sensitive to the value of
`getOption("mvp_mult_symbol")`; set this to `"*"` to get
`mpoly`-compatible output.

Function `taylor()` is a convenience wrapper for `series()`.

Functions `mvp_taylor_onevar()`, `mvp_taylor_allvars()` and
`mvp_to_series()` are low-level helper functions that are not intended
for the user.

## Author

Robin K. S. Hankin

## See also

[`deriv`](https://robinhankin.github.io/mvp/reference/deriv.md)

## Examples

``` r
trunc(as.mvp("1+x")^6,2)
#> mvp object algebraically equal to
#> 1 + 6 x + 15 x^2

trunc(as.mvp("1+x+y")^3,2)      # discards all terms with total power>2
#> mvp object algebraically equal to
#> 1 + 3 x + 6 x y + 3 x^2 + 3 y + 3 y^2
trunc1(as.mvp("1+x+y")^3,x=2)   # terms like y^3 are treated as constants
#> mvp object algebraically equal to
#> 1 + 3 x + 6 x y + 3 x y^2 + 3 x^2 + 3 x^2 y + 3 y + 3 y^2 + y^3

trunc(as.mvp("1+x+y^2")^3,3)    # discards x^2y^2 term (total power=4>3)
#> mvp object algebraically equal to
#> 1 + 3 x + 6 x y^2 + 3 x^2 + x^3 + 3 y^2
truncall(as.mvp("1+x+y^2")^3,3) # retains  x^2y^2 term (all vars to power 2)
#> mvp object algebraically equal to
#> 1 + 3 x + 6 x y^2 + 3 x^2 + 3 x^2 y^2 + x^3 + 3 y^2

onevarpow(as.mvp("1+x+x*y^2  + z*y^2*x"),x=1,y=2)
#> mvp object algebraically equal to
#> 1 + z

(p2 <- rmvp(10))
#> mvp object algebraically equal to
#> 9 + 3 a + 5 a b^3 d e + 5 a d^2 + 2 b d^3 + c^2 d + 6 d e^2 + 9 d f + d^2 e f +
#> 10 e^2
series(p2,"a")
#> a^0(9  +  2 b d^3  +  c^2 d  +  6 d e^2  +  9 d f  +  d^2 e f  +  10 e^2 )  + 
#> a^1(3  +  5 b^3 d e  +  5 d^2 )
#> 

# Works well with pipes:

f <- function(n){as.mvp(sub('n',n,'1+x^n*y'))}
Reduce(`*`,lapply(1:6,f)) |> series('y')
#> y^0(1)  + y^1(x  +  x^2  +  x^3  +  x^4  +  x^5  +  x^6 )  + y^2(x^3  +  x^4  + 
#>  2 x^5  +  2 x^6  +  3 x^7  +  2 x^8  +  2 x^9  +  x^10  +  x^11 )  + y^3(x^6  
#> +  x^7  +  2 x^8  +  3 x^9  +  3 x^10  +  3 x^11  +  3 x^12  +  2 x^13  +  x^14 
#>  +  x^15 )  + y^4(x^10  +  x^11  +  2 x^12  +  2 x^13  +  3 x^14  +  2 x^15  +  
#> 2 x^16  +  x^17  +  x^18 )  + y^5(x^15  +  x^16  +  x^17  +  x^18  +  x^19  +  
#> x^20 )  + y^6(x^21 )
#> 
Reduce(`*`,lapply(1:6,f)) |> series('x')
#> x^0(1)  + x^1(y )  + x^2(y )  + x^3(y  +  y^2 )  + x^4(y  +  y^2 )  + x^5(y  +  
#> 2 y^2 )  + x^6(y  +  2 y^2  +  y^3 )  + x^7(3 y^2  +  y^3 )  + x^8(2 y^2  +  2 
#> y^3 )  + x^9(2 y^2  +  3 y^3 )  + x^10(y^2  +  3 y^3  +  y^4 )  + x^11(y^2  +  
#> 3 y^3  +  y^4 )  + x^12(3 y^3  +  2 y^4 )  + x^13(2 y^3  +  2 y^4 )  + x^14(y^3 
#>  +  3 y^4 )  + x^15(y^3  +  2 y^4  +  y^5 )  + x^16(2 y^4  +  y^5 )  + x^17(y^4 
#>  +  y^5 )  + x^18(y^4  +  y^5 )  + x^19(y^5 )  + x^20(y^5 )  + x^21(y^6 )
#> 


(p <- horner("x+y",1:4))
#> mvp object algebraically equal to
#> 1 + 2 x + 6 x y + 12 x y^2 + 3 x^2 + 12 x^2 y + 4 x^3 + 2 y + 3 y^2 + 4 y^3
onevarpow(p,x=2)   # coefficient of x^2
#> mvp object algebraically equal to
#> 3 + 12 y
onevarpow(p,x=3)   # coefficient of x^3
#> mvp object algebraically equal to
#> 4


p |> trunc(2)
#> mvp object algebraically equal to
#> 1 + 2 x + 6 x y + 3 x^2 + 2 y + 3 y^2
p |> trunc1(x=2)
#> mvp object algebraically equal to
#> 1 + 2 x + 6 x y + 12 x y^2 + 3 x^2 + 12 x^2 y + 2 y + 3 y^2 + 4 y^3
(p |> subs(x="x+dx") -p) |> trunc1(dx=2)
#> mvp object algebraically equal to
#> 2 dx + 6 dx x + 24 dx x y + 12 dx x^2 + 6 dx y + 12 dx y^2 + 3 dx^2 + 12 dx^2 x
#> + 12 dx^2 y

# Nice example of Horner's method:
(p <- as.mvp("x + y + 3*x*y"))
#> mvp object algebraically equal to
#> x + 3 x y + y
trunc(horner(p,1:5)*(1-p)^2,4)  # should be 1
#> mvp object algebraically equal to
#> 1


## Third order taylor expansion of f(x)=sin(x+y) for x=1.1, about x=1:
(sinxpy <- horner("x+y",c(0,1,0,-1/6,0,+1/120,0,-1/5040,0,1/362880)))  # sin(x+y)
#> mvp object algebraically equal to
#> x - 0.5 x y^2 + 0.04166667 x y^4 - 0.001388889 x y^6 + 0.00002480159 x y^8 -
#> 0.5 x^2 y + 0.08333333 x^2 y^3 - 0.004166667 x^2 y^5 + 0.00009920635 x^2 y^7 -
#> 0.1666667 x^3 + 0.08333333 x^3 y^2 - 0.006944444 x^3 y^4 + 0.0002314815 x^3 y^6
#> + 0.04166667 x^4 y - 0.006944444 x^4 y^3 + 0.0003472222 x^4 y^5 + 0.008333333
#> x^5 - 0.004166667 x^5 y^2 + 0.0003472222 x^5 y^4 - 0.001388889 x^6 y +
#> 0.0002314815 x^6 y^3 - 0.0001984127 x^7 + 0.00009920635 x^7 y^2 + 0.00002480159
#> x^8 y + 0.000002755732 x^9 + y - 0.1666667 y^3 + 0.008333333 y^5 - 0.0001984127
#> y^7 + 0.000002755732 y^9
dx <- as.mvp("dx")
t3 <- sinxpy  + aderiv(sinxpy,x=1)*dx + aderiv(sinxpy,x=2)*dx^2/2 + aderiv(sinxpy,x=3)*dx^3/6
t3 <- t3 |> subs(x=1,dx=0.1)  # t3 = Taylor expansion of sin(y+1.1)
t3 |> subs(y=0.3)  - sin(1.4)  # numeric; should be small
#> [1] -3.039554e-06
```
