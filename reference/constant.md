# The constant term

Get and set the constant term of an `mvp` object

## Usage

``` r
# S3 method for class 'mvp'
constant(x)
# S3 method for class 'mvp'
constant(x) <- value
# S3 method for class 'numeric'
constant(x)
is.constant(x)
```

## Arguments

- x:

  Object of class `mvp`

- value:

  Scalar value for the constant

## Details

The constant term in a polynomial is the coefficient of the empty term.
In an `mvp` object, the map `{} -> c`, implies that `c` is the constant.

If `x` is an `mvp` object, `constant(x)` returns the value of the
constant in the multivariate polynomial; if `x` is numeric, it returns a
constant multivariate polynomial with value `x`.

Function `is.constant()` returns `TRUE` if its argument has no variables
and `FALSE` otherwise.

## Author

Robin K. S. Hankin

## Examples

``` r
a <- rmvp(5)+4
a
#> mvp object algebraically equal to
#> 4 + 5 b c e f^2 + 3 c + 5 c d^2 e^2 + 3 d e + 2 e f^3
constant(a)
#> [1] 4
constant(a) <- 33
a
#> mvp object algebraically equal to
#> 33 + 5 b c e f^2 + 3 c + 5 c d^2 e^2 + 3 d e + 2 e f^3

constant(0)  # the zero mvp
#> mvp object algebraically equal to
#> 0
```
