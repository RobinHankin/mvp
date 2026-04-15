# Spray-style specification of mvp objects

Create an `mvp` object using an index matrix and a vector of
coefficients, [spray](https://CRAN.R-project.org/package=spray)-style.

## Usage

``` r
mmvp(M, coeffs, vars)
```

## Arguments

- M:

  Integer matrix with rows corresponding to terms of a multivariate
  polynomial

- coeffs:

  Numeric vector of coefficients; if missing, default to a vector of 1s

- vars:

  Character vector of variable names

## Details

Function `mmvp()` uses syntax similar to
[`spray::spray()`](https://robinhankin.github.io/spray/reference/spray.html)
but adapted for the mvp package.

If argument `vars` is missing, variables are named after the colnames of
`M`.

The function has special dispensation if `M` is a
[partitions](https://CRAN.R-project.org/package=partitions) object. So,
`mmvp(parts(5))` and `mmvp(blockparts(1:5,3))` and
`mmvp(compositions(4,3))` and `mmvp(multiset(c(1,2,2,3)))` work as
expected \[returning homogeneous polynomials\].

## Value

Returns a multivariate polynomial, an object of class `mvp`

## Author

Robin K. S. Hankin

## Examples

``` r
mmvp(matrix(1:35, 5, 7))
#> mvp object algebraically equal to
#> a b^6 c^11 d^16 e^21 f^26 g^31 + a^2 b^7 c^12 d^17 e^22 f^27 g^32 + a^3 b^8
#> c^13 d^18 e^23 f^28 g^33 + a^4 b^9 c^14 d^19 e^24 f^29 g^34 + a^5 b^10 c^15
#> d^20 e^25 f^30 g^35

mmvp(matrix(rpois(21,1), ncol=3), 1:7)
#> mvp object algebraically equal to
#> a^2 + 4 a^2 b + 7 a^2 b c^2 + 2 b c + 5 b^2 + 3 b^3 + 6 c^3
```
