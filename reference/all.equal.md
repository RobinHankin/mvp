# Approximate equality of mvp objects

Two multivariate polynomials \\x,y\\ are held to be approximately equal
if the coefficients of \\x-y\\ are small compared to the coefficients of
\\x\\ and \\y\\ separately. The comparison `all.equal()` is dispatched
to `all_equal_mvp()` which uses
[`base::all.equal()`](https://rdrr.io/r/base/all.equal.html).

## Usage

``` r
all_equal_mvp(target, current)
```

## Arguments

- target,current:

  Objects of class `mvp`

## Author

Robin K. S. Hankin

## Examples

``` r
a <- rmvp()
a1 <- a + rmvp()/1e5
a2 <- a - rmvp()/1e5
all.equal(a1,a2)
#> [1] "Mean scaled difference: 6.714267e-06"
```
