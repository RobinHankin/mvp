# All variables in a multivariate polynomial

Returns a character vector containing all the variables present in a
`mvp` object.

## Usage

``` r
allvars(x)
```

## Arguments

- x:

  object of class `mvp`

## Author

Robin K. S. Hankin

## Note

The character vector returned is not in any particular order. It might
have been better for `allvars()` to return a `disord` object.

## Examples

``` r
p <- rmvp(5)
p
#> mvp object algebraically equal to
#> 5 + 5 c d^3 + 3 c d^3 e^2 + 2 e f + 2 f
allvars(p)
#> [1] "c" "d" "e" "f"
```
