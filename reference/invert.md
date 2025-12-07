# Replace symbols with their reciprocals

Given an `mvp` object, replace one or more symbols with their
reciprocals

## Usage

``` r
invert(p, v)
```

## Arguments

- p:

  Object (coerced to) `mvp` form

- v:

  Character vector of symbols to be replaced with their reciprocal;
  missing interpreted as replace all symbols

## Author

Robin K. S. Hankin

## See also

[`subs`](https://robinhankin.github.io/mvp/reference/subs.md)

## Examples

``` r
invert("x")
#> mvp object algebraically equal to
#> x^-1

(P <- as.mvp("1+a+6*a^2 -7*a*b"))
#> mvp object algebraically equal to
#> 1 + a - 7 a b + 6 a^2
invert(P,"a")
#> mvp object algebraically equal to
#> 1 + 6 a^-2 + a^-1 - 7 a^-1 b
```
