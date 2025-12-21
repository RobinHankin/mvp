# A sparse multivariate polynomial

A sparse multivariate polynomial inspired by Kahle (2013)

## Usage

``` r
kahle(n = 26, r = 1, p = 1, coeffs = 1, symbols = letters)
```

## Arguments

- n:

  Number of different symbols to use

- r:

  Number of symbols in a single term

- p:

  Power of each symbol in each terms

- coeffs:

  Coefficients of the terms

- symbols:

  Alphabet of symbols

## References

David Kahle 2013. “[mpoly](https://CRAN.R-project.org/package=mpoly):
multivariate polynomials in R”. *R Journal*, volume 5/1.

## Author

Robin K. S. Hankin

## See also

[`special`](https://robinhankin.github.io/mvp/reference/special.md)

## Examples

``` r
kahle()  # a+b+...+z
#> mvp object algebraically equal to
#> a + b + c + d + e + f + g + h + i + j + k + l + m + n + o + p + q + r + s + t +
#> u + v + w + x + y + z
kahle(r=2,p=1:2)  # Kahle's original example
#> mvp object algebraically equal to
#> a z^2 + a^2 b + b^2 c + c^2 d + d^2 e + e^2 f + f^2 g + g^2 h + h^2 i + i^2 j +
#> j^2 k + k^2 l + l^2 m + m^2 n + n^2 o + o^2 p + p^2 q + q^2 r + r^2 s + s^2 t +
#> t^2 u + u^2 v + v^2 w + w^2 x + x^2 y + y^2 z

## example where mvp runs faster than spray (mvp does not need a 200x200 matrix):
k <- kahle(200,r=3,p=1:3,symbols=paste("x",sprintf("%02d",1:200),sep=""))
system.time(ignore <- k^2)
#>    user  system elapsed 
#>   1.161   0.007   1.168 
#system.time(ignore <- mvp_to_spray(k)^2)   # needs spray package loaded
```
