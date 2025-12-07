# Horner's method

Horner's method for multivariate polynomials

## Usage

``` r
horner(P,v)
```

## Arguments

- P:

  Multivariate polynomial

- v:

  Numeric vector of coefficients

## Details

Given a polynomial

\$\$p(x) = a_0 +a_1+a_2x^2+\cdots + a_nx^n\$\$

it is possible to express \\p(x)\\ in the algebraically equivalent form

\$\$p(x) = a_0 + x\left(a_1+x\left(a_2+\cdots + x\left(a\_{n-1} +xa_n
\right)\cdots\right)\right)\$\$

which is much more efficient for evaluation, as it requires only \\n\\
multiplications and \\n\\ additions, and this is optimal. But this is
not implemented here because it's efficient. It is implemented because
it works if \\x\\ is itself a (multivariate) polynomial, and that is the
second coolest thing ever. The coolest thing ever is the
[`Reduce()`](https://rdrr.io/r/base/funprog.html) function.

## Author

Robin K. S. Hankin

## See also

[`ooom`](https://robinhankin.github.io/mvp/reference/ooom.md)

## Examples

``` r
horner("x",1:5)
#> mvp object algebraically equal to
#> 1 + 2 x + 3 x^2 + 4 x^3 + 5 x^4
horner("x+y",1:3)
#> mvp object algebraically equal to
#> 1 + 2 x + 6 x y + 3 x^2 + 2 y + 3 y^2

w <- as.mvp("x+y^2")
stopifnot(1 + 2*w + 3*w^2 == horner(w,1:3))  # note off-by-one issue

"x+y+x*y" |> horner(1:3) |> horner(1:2)
#> mvp object algebraically equal to
#> 3 + 4 x + 16 x y + 12 x y^2 + 6 x^2 + 12 x^2 y + 6 x^2 y^2 + 4 y + 6 y^2
```
