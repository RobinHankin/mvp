# Arithmetic Ops Group Methods for `mvp` objects

Allows arithmetic operators to be used for multivariate polynomials such
as addition, multiplication, integer powers, etc.

## Usage

``` r
# S3 method for class 'mvp'
Ops(e1, e2)
mvp_negative(S)
mvp_times_mvp(S1,S2)
mvp_times_scalar(S,x)
mvp_plus_mvp(S1,S2)
mvp_plus_numeric(S,x)
mvp_eq_mvp(S1,S2)
mvp_modulo(S1,S2)
```

## Arguments

- e1,e2,S,S1,S2:

  Objects of class `mvp`

- x:

  Scalar, length one numeric vector

## Details

The function `Ops.mvp()` passes unary and binary arithmetic operators
“`+`”, “`-`”, “`*`” and “`^`” to the appropriate specialist function.

The most interesting operator is “`*`”, which is passed to
`mvp_times_mvp()`. I guess “`+`” is quite interesting too.

The caret “`^`” denotes arithmetic exponentiation, as in `x^3==x*x*x`.
As an experimental feature, this is (sort of) vectorised: if `n` is a
vector, then `a^n` returns the sum of `a` raised to the power of each
element of `n`. For example, `a^c(n1,n2,n3)` is `a^n1 + a^n2 + a^n3`.
Internally, `n` is tabulated in the interests of efficiency, so
`a^c(0,2,5,5,5) = 1 + a^2 + 3a^5` is evaluated with only a single fifth
power. Similar functionality is implemented in the
[freealg](https://CRAN.R-project.org/package=freealg) package.

## Value

The high-level functions documented here return an object of `mvp`, the
low-level functions documented at `lowlevel.Rd` return lists. But don't
use the low-level functions.

## Author

Robin K. S. Hankin

## Note

Function `mvp_modulo()` is distinctly sub-optimal and
`inst/mvp_modulo.Rmd` details ideas for better implementation.

## See also

[`lowlevel`](https://robinhankin.github.io/mvp/reference/lowlevel.md)

## Examples

``` r
(p1 <- rmvp(3))
#> mvp object algebraically equal to
#> b^2 d e f^2 + b^2 d^2 e^2 + d^2 e^2 f^2
(p2 <- rmvp(3))
#> mvp object algebraically equal to
#> a b^2 d^2 f + 3 a^2 e^2 f + 2 c f^3

p1*p2
#> mvp object algebraically equal to
#> a b^2 d^4 e^2 f^3 + a b^4 d^3 e f^3 + a b^4 d^4 e^2 f + 3 a^2 b^2 d e^3 f^3 + 3
#> a^2 b^2 d^2 e^4 f + 3 a^2 d^2 e^4 f^3 + 2 b^2 c d e f^5 + 2 b^2 c d^2 e^2 f^3 +
#> 2 c d^2 e^2 f^5

p1+p2
#> mvp object algebraically equal to
#> a b^2 d^2 f + 3 a^2 e^2 f + b^2 d e f^2 + b^2 d^2 e^2 + 2 c f^3 + d^2 e^2 f^2

p1^3
#> mvp object algebraically equal to
#> 3 b^2 d^5 e^5 f^6 + 3 b^2 d^6 e^6 f^4 + 3 b^4 d^4 e^4 f^6 + 6 b^4 d^5 e^5 f^4 +
#> 3 b^4 d^6 e^6 f^2 + b^6 d^3 e^3 f^6 + 3 b^6 d^4 e^4 f^4 + 3 b^6 d^5 e^5 f^2 +
#> b^6 d^6 e^6 + d^6 e^6 f^6


p1*(p1+p2) == p1^2+p1*p2  # should be TRUE
#> [1] TRUE
```
