# Print methods for `mvp` objects

Print methods for `mvp` objects: to print, an `mvp` object is coerced to
`mpoly` form and the `mpoly` print method used.

## Usage

``` r
# S3 method for class 'mvp'
print(x, ...)
```

## Arguments

- x:

  Object of class `mvp`, coerced to `mpoly` form

- ...:

  Further arguments

## Details

See `mvp.Rd` for notes on interactive inspection in Rstudio.

## Value

Returns its argument invisibly

## Author

Robin K. S. Hankin

## See also

[`mvp`](https://robinhankin.github.io/mvp/reference/mvp.md)

## Examples

``` r

a <- rmvp(4)
a
#> mvp object algebraically equal to
#> 2 + 4 a b d^2 + 3 a^3 c e f + b^2 f^2
print(a)
#> mvp object algebraically equal to
#> 2 + 4 a b d^2 + 3 a^3 c e f + b^2 f^2
print(a,stars=TRUE)
#> mvp object algebraically equal to
#> 2 + 4 * a * b * d**2 + 3 * a**3 * c * e * f + b**2 * f**2
print(a,varorder=rev(letters))
#> mvp object algebraically equal to
#> f^2 b^2 + 3 f e c a^3 + 4 d^2 b a + 2
```
