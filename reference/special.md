# Various functions to create simple multivariate polynomials

Various functions to create simple `mvp` objects such as single-term,
homogeneous, and constant multivariate polynomials.

## Usage

``` r
product(v,symbols=letters)
homog(d,power=1,symbols=letters)
linear(x,power=1,symbols=letters)
xyz(n,symbols=letters)
numeric_to_mvp(x)
```

## Arguments

- d,n:

  An integer; generally, the dimension or arity of the resulting `mvp`
  object

- v,power:

  Integer vector of powers

- x:

  Numeric vector of coefficients

- symbols:

  Character vector for the symbols

## Value

All functions documented here return a `mvp` object

## Author

Robin K. S. Hankin

## Note

The functions here are related to their equivalents in the multipol and
spray packages, but are not exactly the same.

Function
[`constant()`](https://robinhankin.github.io/mvp/reference/constant.html)
is documented at `constant.Rd`, but is listed below for convenience.

## See also

[`constant`](https://robinhankin.github.io/mvp/reference/constant.html),
[`zero`](https://robinhankin.github.io/mvp/reference/zero.md)

## Examples

``` r
product(1:3)        #      a * b^2 * c^3
#> mvp object algebraically equal to
#> a b^2 c^3
homog(3)            #      a + b + c
#> mvp object algebraically equal to
#> a + b + c
homog(3,2)          #      a^2  + a b + a c + b^2 + b c + c^2
#> mvp object algebraically equal to
#> a b + a c + a^2 + b c + b^2 + c^2
linear(1:3)         #      1*a + 2*b + 3*c
#> mvp object algebraically equal to
#> a + 2 b + 3 c
constant(5)         #      5
#> mvp object algebraically equal to
#> 5
xyz(5)              #      a*b*c*d*e
#> mvp object algebraically equal to
#> a b c d e
```
