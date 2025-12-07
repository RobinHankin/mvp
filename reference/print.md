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

## Value

Returns its argument invisibly

## Author

Robin K. S. Hankin

## Examples

``` r
a <- rmvp(4)
a
#> mvp object algebraically equal to
#> 2 + 2 a b c^3 + 4 a^2 + 3 b
print(a)
#> mvp object algebraically equal to
#> 2 + 2 a b c^3 + 4 a^2 + 3 b
print(a,stars=TRUE)
#> mvp object algebraically equal to
#> 2 + 2 * a * b * c**3 + 4 * a**2 + 3 * b
print(a,varorder=rev(letters))
#> mvp object algebraically equal to
#> 2 c^3 b a + 3 b + 4 a^2 + 2
```
