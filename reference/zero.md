# The zero polynomial

Test for a multivariate polynomial being zero

## Usage

``` r
is.zero(x)
```

## Arguments

- x:

  Object of class `mvp`

## Details

Function `is.zero()` returns `TRUE` if `x` is indeed the zero
polynomial. It is defined as `length(vars(x))==0` for reasons of
efficiency, but conceptually it returns `x==constant(0)`.

(Use `constant(0)` to create the zero polynomial).

## Author

Robin K. S. Hankin

## Note

I would have expected the zero polynomial to be problematic (cf the
[freegroup](https://CRAN.R-project.org/package=freegroup) and
[permutations](https://CRAN.R-project.org/package=permutations)
packages, where similar issues require extensive special case
treatment). But it seems to work fine, which is a testament to the
robust coding in the STL.

A general `mvp` object is something like

`{{"x" -> 3, "y" -> 5} -> 6, {"x" -> 1, "z" -> 8} -> -7}}`

which would be \\6x^3y^5-7xz^8\\. The zero polynomial is just
[`{}`](https://rdrr.io/r/base/Paren.html). Neat, eh?

## See also

[`constant`](https://robinhankin.github.io/mvp/reference/constant.html)

## Examples

``` r
constant(0)
#> mvp object algebraically equal to
#> 0

t1 <- as.mvp("x+y")
t2 <- as.mvp("x-y")

stopifnot(is.zero(t1*t2-as.mvp("x^2-y^2")))
```
