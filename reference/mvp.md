# Multivariate polynomials, mvp objects

Create, test for, and coerce to, `mvp` objects

## Usage

``` r
mvp(vars, powers, coeffs)
is_ok_mvp(vars,powers,coeffs)
is.mvp(x)
as.mvp(x)
# S3 method for class 'character'
as.mvp(x)
# S3 method for class 'list'
as.mvp(x)
# S3 method for class 'mpoly'
as.mvp(x)
# S3 method for class 'mvp'
as.mvp(x)
# S3 method for class 'numeric'
as.mvp(x)
```

## Arguments

- vars:

  List of variables comprising each term of an `mvp` object

- powers:

  List of powers corresponding to the variables of the `vars` argument

- coeffs:

  Numeric vector corresponding to the coefficients to each element of
  the `var` and `powers` lists

- x:

  Object to be coerced to or tested for being class `mvp`

## Details

Function `mvp()` is the formal creation mechanism for `mvp` objects.
However, it is not very user-friendly; it is better to use `as.mvp()` in
day-to-day use.

Function `is_ok_mvp()` checks for consistency of its arguments.

## Author

Robin K. S. Hankin

## Examples

``` r
mvp(list("x", c("x","y"), "a", c("y","x")), list(1,1:2,3,c(-1,4)), 1:4)
#> mvp object algebraically equal to
#> 3 a^3 + x + 2 x y^2 + 4 x^4 y^-1

## Note how the terms appear in an arbitrary order, as do
## the symbols within a term.

kahle  <- mvp(
    vars   = split(cbind(letters,letters[c(26,1:25)]),rep(seq_len(26),each=2)),
    powers = rep(list(1:2),26),
    coeffs = 1:26
)
kahle
#> mvp object algebraically equal to
#> a b^2 + 14 a^2 z + 15 b c^2 + 2 c d^2 + 16 d e^2 + 3 e f^2 + 17 f g^2 + 4 g h^2
#> + 18 h i^2 + 5 i j^2 + 19 j k^2 + 6 k l^2 + 20 l m^2 + 7 m n^2 + 21 n o^2 + 8 o
#> p^2 + 22 p q^2 + 9 q r^2 + 23 r s^2 + 10 s t^2 + 24 t u^2 + 11 u v^2 + 25 v w^2
#> + 12 w x^2 + 26 x y^2 + 13 y z^2
## again note arbitrary order of terms and symbols within a term

## Standard arithmetic rules apply:

a <- as.mvp("1 + 4*x*y + 7*z")
b <- as.mvp("-7*z + 3*x^34 - 2*z*x")

a+b
#> mvp object algebraically equal to
#> 1 + 4 x y - 2 x z + 3 x^34
a*b^2
#> mvp object algebraically equal to
#> 196 x y z^2 + 28 x z^2 + 196 x z^3 + 112 x^2 y z^2 + 4 x^2 z^2 + 28 x^2 z^3 +
#> 16 x^3 y z^2 - 42 x^34 z - 294 x^34 z^2 - 168 x^35 y z - 12 x^35 z - 84 x^35
#> z^2 - 48 x^36 y z + 9 x^68 + 63 x^68 z + 36 x^69 y + 49 z^2 + 343 z^3

(a+b)*(a-b) == a^2-b^2 # should be TRUE
#> [1] TRUE


## variable "xy" is distinct from "x*y":

as.mvp("x + y + xy")^2
#> mvp object algebraically equal to
#> 2 x xy + 2 x y + x^2 + 2 xy y + xy^2 + y^2
as.mvp(paste(state.name[1:5],collapse="+"))^2
#> mvp object algebraically equal to
#> 2 Alabama Alaska + 2 Alabama Arizona + 2 Alabama Arkansas + 2 Alabama
#> California + Alabama^2 + 2 Alaska Arizona + 2 Alaska Arkansas + 2 Alaska
#> California + Alaska^2 + 2 Arizona Arkansas + 2 Arizona California + Arizona^2 +
#> 2 Arkansas California + Arkansas^2 + California^2

```
