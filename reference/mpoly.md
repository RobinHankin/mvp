# Conversion to and from mpoly form

The [mpoly](https://CRAN.R-project.org/package=mpoly) package by David
Kahle provides similar functionality to this package, and the functions
documented here convert between mpoly and `mvp` objects. The mvp package
uses [`mpoly::mp()`](https://rdrr.io/pkg/mpoly/man/mp.html) to convert
character strings to `mvp` objects.

## Usage

``` r
mpoly_to_mvp(m)
# S3 method for class 'mvp'
as.mpoly(x,...)
```

## Arguments

- m:

  object of class mvp

- x:

  object of class mpoly

- ...:

  further arguments, currently ignored

## Author

Robin K. S. Hankin

## Examples

``` r
x <- rmvp(5)

x == mpoly_to_mvp(mpoly::as.mpoly(x))        # should be TRUE
#> [1] TRUE
```
