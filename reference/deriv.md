# Differentiation of `mvp` objects

Differentiation of `mvp` objects

## Usage

``` r
# S3 method for class 'mvp'
deriv(expr, v, ...)
# S3 method for class 'mvp'
aderiv(expr, ...)
```

## Arguments

- expr:

  Object of class `mvp`

- v:

  Character vector. Elements denote variables to differentiate with
  respect to

- ...:

  Further arguments. In `deriv()`, a non-negative integer argument
  specifies the order of the differential, and in `aderiv()` the
  argument names specify the differentials and their values their
  respective orders

## Author

Robin K. S. Hankin

## See also

[`taylor`](https://robinhankin.github.io/mvp/reference/series.md)

## Details

`deriv(S,v)` returns \\\frac{\partial^r S}{\partial v_1\partial
v_2\ldots\partial v_r}\\. Here, `v` is a (character) vector of symbols.

`deriv(S,v,n)` returns the n-th derivative of `S` with respect to symbol
`v`, \\\frac{\partial^n S}{\partial v^n}\\.

`aderiv()` uses the ellipsis construction with the names of the argument
being the variable to be differentiated with respect to. Thus
`aderiv(S,x=1,y=2)` returns \\\frac{\partial^3 S}{\partial x\partial
y^2}\\.

## Examples

``` r
(p <- rmvp(10,4,15,5))
#> mvp object algebraically equal to
#> 12 + 7 a b^3 c^4 e + 9 a b^3 d^2 e^2 + 8 a^4 b^4 d^3 e + 10 a^4 b^4 e + 3 a^5
#> b^4 c d^3 + 10 b c^2 + 10 b^3 c^2 + 4 b^5 c^5 d^2
deriv(p,"a")
#> mvp object algebraically equal to
#> 32 a^3 b^4 d^3 e + 40 a^3 b^4 e + 15 a^4 b^4 c d^3 + 7 b^3 c^4 e + 9 b^3 d^2
#> e^2
deriv(p,"a",3)
#> mvp object algebraically equal to
#> 192 a b^4 d^3 e + 240 a b^4 e + 180 a^2 b^4 c d^3
deriv(p,letters[1:3])
#> mvp object algebraically equal to
#> 60 a^4 b^3 d^3 + 84 b^2 c^3 e
deriv(p,rev(letters[1:3]))  # should be the same
#> mvp object algebraically equal to
#> 60 a^4 b^3 d^3 + 84 b^2 c^3 e

aderiv(p,a=1,b=2,c=1)
#> mvp object algebraically equal to
#> 180 a^4 b^2 d^3 + 168 b c^3 e

## verify the chain rule:
x <- rmvp(7,symbols=6)
v <- allvars(x)[1]
s <- as.mvp("1  +  y  -  y^2 zz  +  y^3 z^2")
LHS <- subsmvp(deriv(x,v)*deriv(s,"y"),v,s)   # dx/ds*ds/dy
RHS <- deriv(subsmvp(x,v,s),"y")              # dx/dy

LHS - RHS # should be zero
#> mvp object algebraically equal to
#> 0
```
