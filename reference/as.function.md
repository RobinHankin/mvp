# Functional form for multivariate polynomials

Coerces a multivariate polynomial into a function

## Usage

``` r
# S3 method for class 'mvp'
as.function(x, ...)
```

## Arguments

- x:

  Multivariate polynomial

- ...:

  Further arguments (currently ignored)

## Author

Robin K. S. Hankin

## Examples

``` r
p <- as.mvp("1+a^2 + a*b^2 + c")
p
#> mvp object algebraically equal to
#> 1 + a b^2 + a^2 + c
f <- as.function(p)
f
#> function (...) 
#> {
#>     subs(x, ...)
#> }
#> <bytecode: 0x558f2481c150>
#> <environment: 0x558f2481bcf0>

f(a=1)
#> mvp object algebraically equal to
#> 2 + b^2 + c
f(a=1,b=2)
#> mvp object algebraically equal to
#> 6 + c
f(a=1,b=2,c=3)             # coerces to a scalar
#> [1] 9
f(a=1,b=2,c=3,drop=FALSE)  # formal mvp object
#> mvp object algebraically equal to
#> 9
```
