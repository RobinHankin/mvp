# Summary methods for mvp objects

Summary methods for mvp objects and extraction of typical terms

## Usage

``` r
# S3 method for class 'mvp'
summary(object, ...)
# S3 method for class 'summary.mvp'
print(x, ...)
rtypical(object,n=3)
```

## Arguments

- x,object:

  Multivariate polynomial, class `mvp`

- n:

  In `rtypical()`, number of terms (in addition to the constant) to
  select

- ...:

  Further arguments, currently ignored

## Details

The summary method prints out a list of interesting facts about an `mvp`
object such as the longest term or highest power. Function `rtypical()`
extracts the constant if present, and a *random* selection of terms of
its argument.

## Author

Robin K. S. Hankin

## Examples

``` r
summary(rmvp(40))
#> mvp object.
#> Number of terms: 36 
#> Number of distinct symbols: 6 
#> Highest power: 4 
#> Longest term:  4 
#> Has negative powers:  FALSE 
#> Constant:  122 
rtypical(rmvp(40))
#> mvp object algebraically equal to
#> 25 + 30 a b e^2 + 29 a c d + 9 a c f
```
