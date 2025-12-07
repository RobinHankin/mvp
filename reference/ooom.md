# One over one minus a multivariate polynomial

Uses Taylor's theorem to give one over one minus a multipol

## Usage

``` r
ooom(P,n)
```

## Arguments

- n:

  Order of expansion

- P:

  Multivariate polynomial

## Author

Robin K. S. Hankin

## See also

[`horner`](https://robinhankin.github.io/mvp/reference/horner.md)

## Examples

``` r
ooom("x",5)
#> mvp object algebraically equal to
#> 1 + x + x^2 + x^3 + x^4 + x^5
ooom("x",5) * as.mvp("1-x")  # 1 + O(x^6)
#> mvp object algebraically equal to
#> 1 - x^6


ooom("x+y",4)
#> mvp object algebraically equal to
#> 1 + x + 2 x y + 3 x y^2 + 4 x y^3 + x^2 + 3 x^2 y + 6 x^2 y^2 + x^3 + 4 x^3 y +
#> x^4 + y + y^2 + y^3 + y^4

"x+y" |> ooom(5) |> aderiv(x=2,y=1)
#> mvp object algebraically equal to
#> 6 + 24 x + 120 x y + 60 x^2 + 24 y + 60 y^2
```
