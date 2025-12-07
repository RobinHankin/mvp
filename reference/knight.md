# Chess knight

Generating function for a chess knight on an infinite \\d\\-dimensional
chessboard

## Usage

``` r
knight(d, can_stay_still = FALSE)
```

## Arguments

- d:

  Dimension of the board

- can_stay_still:

  Boolean, with default `FALSE` meaning that the knight is obliged to
  move and `FALSE` meaning that it has the option of remaining on its
  square

## Author

Robin K. S. Hankin

## Note

The function is a slight modification of
[`spray::knight()`](https://robinhankin.github.io/spray/reference/knight.html).

## Examples

``` r
knight(2)      # regular chess knight on a regular chess board
#> mvp object algebraically equal to
#> a^-2 b^-1 + a^-2 b + a^-1 b^-2 + a^-1 b^2 + a b^-2 + a b^2 + a^2 b^-1 + a^2 b
knight(2,TRUE) # regular chess knight that can stay still
#> mvp object algebraically equal to
#> 1 + a^-2 b^-1 + a^-2 b + a^-1 b^-2 + a^-1 b^2 + a b^-2 + a b^2 + a^2 b^-1 + a^2
#> b

# Q: how many ways are there for a 4D knight to return to its starting
# square after four moves?

# A:
constant(knight(4)^4)
#> [1] 12528

# Q ...and how many ways in four moves or fewer?

# A1:
constant(knight(4,TRUE)^4)
#> [1] 12817

# A2:
constant((1+knight(4))^4)
#> [1] 12817
```
