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
#> 2 a^2 b c^2 + 3 a^2 d e + b^2 e f
(p2 <- rmvp(3))
#> mvp object algebraically equal to
#> 3 + 3 a d e + 2 f

p1*p2
#> mvp object algebraically equal to
#> 3 a b^2 d e^2 f + 6 a^2 b c^2 + 4 a^2 b c^2 f + 9 a^2 d e + 6 a^2 d e f + 6 a^3
#> b c^2 d e + 9 a^3 d^2 e^2 + 3 b^2 e f + 2 b^2 e f^2

p1+p2
#> mvp object algebraically equal to
#> 3 + 3 a d e + 2 a^2 b c^2 + 3 a^2 d e + b^2 e f + 2 f

p1^3
#> mvp object algebraically equal to
#> 9 a^2 b^4 d e^3 f^2 + 6 a^2 b^5 c^2 e^2 f^2 + 27 a^4 b^2 d^2 e^3 f + 36 a^4 b^3
#> c^2 d e^2 f + 12 a^4 b^4 c^4 e f + 54 a^6 b c^2 d^2 e^2 + 36 a^6 b^2 c^4 d e +
#> 8 a^6 b^3 c^6 + 27 a^6 d^3 e^3 + b^6 e^3 f^3


p1*(p1+p2) == p1^2+p1*p2  # should be TRUE
#> [1] TRUE
```
