# Drop empty variables

Convert an `mvp` object which is a pure constant into a scalar whose
value is the coefficient of the empty term.

A few functions in the package (currently
[`subs()`](https://robinhankin.github.io/mvp/reference/subs.md),
[`subsy()`](https://robinhankin.github.io/mvp/reference/subs.md)) take a
`drop` argument that behaves much like the `drop` argument in base
extraction.

Function `drop()` is an S4 generic, which is why the package calls
`setOldClass()`.

Function `drop()` was formerly called `lose()`.

## Usage

``` r
# S4 method for class 'mvp'
drop(x)
```

## Arguments

- x:

  Object of class `mvp`

## Author

Robin K. S. Hankin

## See also

[`subs`](https://robinhankin.github.io/mvp/reference/subs.md)

## Examples

``` r
(m1 <- as.mvp("1+bish +bash^2 + bosh^3"))
#> mvp object algebraically equal to
#> 1 + bash^2 + bish + bosh^3
(m2 <- as.mvp("bish +bash^2 + bosh^3"))
#> mvp object algebraically equal to
#> bash^2 + bish + bosh^3

m1-m2         # an mvp object
#> mvp object algebraically equal to
#> 1
drop(m1-m2)   # numeric
#> [1] 1


```
