# Laurent factor

Given a multivariate polynomial \\P\\, possibly with symbols raised to a
negative power, return the minimal one-term polynomial required to lift
\\P\\ to a standard multivariate polynomial: `P * laurent_factor(P)` is
guaranteed to have no negative powers.

## Usage

``` r
laurent_factor(P)
```

## Arguments

- P:

  Object of class `mvp`

## Details

The returned polynomial has coefficient 1.

## Author

Robin K. S. Hankin

## Examples

``` r

laurent_factor(invert(rmvp()))
#> mvp object algebraically equal to
#> b c d e^3

P <- rmvp() * invert(rmvp())

P * laurent_factor(P)
#> mvp object algebraically equal to
#> 6 a b c^3 d e^2 f^2 + 8 a^2 b c d^2 e^2 f^2 + 14 a^2 b c^2 d f^4 + 16 a^2 b c^2
#> d^2 + 28 a^2 b c^2 d^2 e^2 f + 39 a^2 b c^2 d^2 e^2 f^2 + 8 a^2 b c^2 d^2 e^2
#> f^3 + 4 a^2 b c^2 d^2 f + 14 a^2 b c^2 d^3 e^2 f^3 + 16 a^2 b c^2 d^3 e^2 f^4 +
#> 8 a^2 b c^2 d^3 f^2 + 28 a^2 b c^2 f^2 + 7 a^2 b c^2 f^3 + 18 a^2 b^2 c^2 d e^2
#> f^2 + 16 a^2 b^2 c^3 d^2 + 28 a^2 b^2 c^3 d^2 e^2 f + 32 a^2 b^2 c^3 d^2 e^2
#> f^2 + 28 a^2 b^2 c^3 f^2 + 8 a^2 d^2 e^2 f^2 + 2 a^2 d^2 e^2 f^3 + 4 a^2 d^3
#> e^2 f^4 + 2 a^3 b c d^2 e^2 f^2 + 4 a^3 b^2 c^3 d^2 + 7 a^3 b^2 c^3 d^2 e^2 f +
#> 8 a^3 b^2 c^3 d^2 e^2 f^2 + 7 a^3 b^2 c^3 f^2 + 6 a^4 b^2 d^2 e^2 f^2 + 12 a^4
#> b^3 c^2 d^2 + 21 a^4 b^3 c^2 d^2 e^2 f + 24 a^4 b^3 c^2 d^2 e^2 f^2 + 21 a^4
#> b^3 c^2 f^2 + 24 b c^3 d e^2 f^2 + 24 c^2 d e^2 f^2 + 6 c^2 d e^2 f^3 + 12 c^2
#> d^2 e^2 f^4
```
