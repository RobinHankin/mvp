# Substitution

Substitute symbols in an `mvp` object for numbers or other multivariate
polynomials

## Usage

``` r
subs(S, ..., drop = TRUE)
subsy(S, ..., drop = TRUE)
subvec(S, ...)
subsmvp(S,v,X)
varchange(S,...)
varchange_formal(S,old,new)
namechanger(x,old,new)
```

## Arguments

- S,X:

  Multivariate polynomials

- ...:

  named arguments corresponding to variables to substitute

- drop:

  Boolean with default `TRUE` meaning to return a scalar (the constant)
  in place of a constant `mvp` object

- v:

  A string corresponding to the variable to substitute

- old,new,x:

  The old and new variable names respectively; `x` is a character vector

## Value

Functions `subs()`, `subsy()` and `subsmvp()` return a multivariate
polynomial unless `drop` is `TRUE` in which case a length one numeric
vector is returned. Function `subvec()` returns a numeric vector (sic!
the output inherits its order from the arguments).

## Details

Function `subs()` substitutes variables for `mvp` objects, using a
natural R idiom. Observe that this type of substitution is sensitive to
order:

    > p <- as.mvp("a b^2")
    > subs(p,a="b",b="x")
    mvp object algebraically equal to
    x^3
    > subs(p,b="x",a="b")  # same arguments, different order
    mvp object algebraically equal to
    b x^2

Functions `subsy()` and `subsmvp()` are lower-level functions, not
really intended for the end-user. Function `subsy()` substitutes
variables for numeric values (order matters if a variable is substituted
more than once). Function `subsmpv()` takes a `mvp` object and
substitutes another `mvp` object for a specific symbol.

Function `subvec()` substitutes the symbols of `S` with numerical
values. It is vectorised in its ellipsis arguments with recycling rules
and names behaviour inherited from
[`cbind()`](https://rdrr.io/r/base/cbind.html). However, if the first
element of `...` is a matrix, then this is interpreted by rows, with
symbol names given by the matrix column names; further arguments are
ignored. Unlike `subs()`, this function is generally only useful if all
symbols are given a value; unassigned symbols take a value of zero.

Function `varchange()` makes a *formal* variable substitution. It is
useful because it can take non-standard variable names such as “`(a-b)`”
or “`?`”, and is used in
[`taylor()`](https://robinhankin.github.io/mvp/reference/series.md).
Function `varchange_formal()` does the same task, but takes two
character vectors, `old` and `new`, which might be more convenient than
passing named arguments. Remember that non-standard names might need to
be quoted; also you might need to escape some characters, see the
examples. Function `namechanger()` is a low-level helper function that
uses regular expression idiom to substitute variable names.

## Author

Robin K. S. Hankin

## See also

[`drop`](https://robinhankin.github.io/mvp/reference/drop.md)

## Examples

``` r
p <- rmvp(6,2,2,letters[1:3])
p
#> mvp object algebraically equal to
#> 10 a + a b + 6 b + 4 b^2
subs(p,a=1)
#> mvp object algebraically equal to
#> 10 + 7 b + 4 b^2
subs(p,a=1,b=2)
#> [1] 40

subs(p,a="1+b x^3",b="1-y")
#> mvp object algebraically equal to
#> 21 + 11 x^3 - 12 x^3 y + x^3 y^2 - 15 y + 4 y^2
subs(p,a=1,b=2,c=3,drop=FALSE)
#> mvp object algebraically equal to
#> 40

do.call(subs,c(list(as.mvp("z")),rep(c(z="C+z^2"),5)))
#> mvp object algebraically equal to
#> C + 2 C z^16 + 4 C z^24 + 8 C z^28 + 16 C z^30 + C^2 + 4 C^2 z^8 + 8 C^2 z^12 +
#> 16 C^2 z^14 + 6 C^2 z^16 + 24 C^2 z^20 + 48 C^2 z^22 + 28 C^2 z^24 + 112 C^2
#> z^26 + 120 C^2 z^28 + 2 C^3 + 8 C^3 z^4 + 16 C^3 z^6 + 16 C^3 z^8 + 48 C^3 z^10
#> + 80 C^3 z^12 + 48 C^3 z^14 + 60 C^3 z^16 + 240 C^3 z^18 + 320 C^3 z^20 + 336
#> C^3 z^22 + 728 C^3 z^24 + 560 C^3 z^26 + 5 C^4 + 16 C^4 z^2 + 40 C^4 z^4 + 64
#> C^4 z^6 + 156 C^4 z^8 + 256 C^4 z^10 + 248 C^4 z^12 + 480 C^4 z^14 + 1150 C^4
#> z^16 + 1440 C^4 z^18 + 1848 C^4 z^20 + 2912 C^4 z^22 + 1820 C^4 z^24 + 14 C^5 +
#> 48 C^5 z^2 + 120 C^5 z^4 + 304 C^5 z^6 + 560 C^5 z^8 + 816 C^5 z^10 + 1736 C^5
#> z^12 + 3440 C^5 z^14 + 4500 C^5 z^16 + 6160 C^5 z^18 + 8008 C^5 z^20 + 4368 C^5
#> z^22 + 26 C^6 + 112 C^6 z^2 + 360 C^6 z^4 + 832 C^6 z^6 + 1648 C^6 z^8 + 3696
#> C^6 z^10 + 7000 C^6 z^12 + 9888 C^6 z^14 + 13860 C^6 z^16 + 16016 C^6 z^18 +
#> 8008 C^6 z^20 + 44 C^7 + 240 C^7 z^2 + 784 C^7 z^4 + 2048 C^7 z^6 + 5040 C^7
#> z^8 + 9968 C^7 z^10 + 15456 C^7 z^12 + 22176 C^7 z^14 + 24024 C^7 z^16 + 11440
#> C^7 z^18 + 69 C^8 + 416 C^8 z^2 + 1536 C^8 z^4 + 4480 C^8 z^6 + 9940 C^8 z^8 +
#> 17280 C^8 z^10 + 25872 C^8 z^12 + 27456 C^8 z^14 + 12870 C^8 z^16 + 94 C^9 +
#> 640 C^9 z^2 + 2520 C^9 z^4 + 6800 C^9 z^6 + 13740 C^9 z^8 + 22176 C^9 z^10 +
#> 24024 C^9 z^12 + 11440 C^9 z^14 + 114 C^10 + 816 C^10 z^2 + 3040 C^10 z^4 +
#> 7600 C^10 z^6 + 13860 C^10 z^8 + 16016 C^10 z^10 + 8008 C^10 z^12 + 116 C^11 +
#> 800 C^11 z^2 + 2784 C^11 z^4 + 6160 C^11 z^6 + 8008 C^11 z^8 + 4368 C^11 z^10 +
#> 94 C^12 + 608 C^12 z^2 + 1848 C^12 z^4 + 2912 C^12 z^6 + 1820 C^12 z^8 + 60
#> C^13 + 336 C^13 z^2 + 728 C^13 z^4 + 560 C^13 z^6 + 28 C^14 + 112 C^14 z^2 +
#> 120 C^14 z^4 + 8 C^15 + 16 C^15 z^2 + C^16 + z^32

subvec(p,a=1,b=2,c=1:5)   # supply a named list of vectors
#> [1] 40 40 40 40 40

M <- matrix(sample(1:3,26*3,replace=TRUE),ncol=26)
colnames(M) <- letters
rownames(M) <- c("Huey", "Dewie", "Louie")
subvec(kahle(r=3,p=1:3),M)  # supply a matrix
#>  Huey Dewie Louie 
#>   989  2409  1134 

varchange(as.mvp("1+x+xy + x*y"),x="newx") # variable xy unchanged
#> mvp object algebraically equal to
#> 1 + newx + newx y + xy

kahle(5,3,1:3) |> subs(a="a + delta")
#> mvp object algebraically equal to
#> 2 a b delta e^3 + 3 a b^2 c delta^2 + a d^3 e^2 + a^2 b e^3 + 3 a^2 b^2 c delta
#> + a^3 b^2 c + b delta^2 e^3 + b^2 c delta^3 + b^3 c^2 d + c^3 d^2 e + d^3 delta
#> e^2

varchange(p,a="]")  # nonstandard variable names OK
#> mvp object algebraically equal to
#> 10 ] + ] b + 6 b + 4 b^2

varchange_formal(p,"\\]","a")
#> mvp object algebraically equal to
#> 10 a + a b + 6 b + 4 b^2
```
