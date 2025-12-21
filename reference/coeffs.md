# Functionality for `coeffs` objects

Get and set the coefficients of an `mvp` object.

## Usage

``` r
coeffs(x)
vars(x)
powers(x)
coeffs(x) <- value
```

## Arguments

- x:

  Object of class `disord`

- value:

  Object of class `disord`, or length-1 numeric vector

## Details

Function
[`coeffs()`](https://robinhankin.github.io/mvp/reference/coeffs.html)
extracts the coefficients of an `mvp` object. The coefficients may be
set with `coeffs<-()`, as in `coeffs(M) <- value`. These follow
[disordR](https://CRAN.R-project.org/package=disordR) discipline. The
idea is that the methods allow arithmetic operators to be used for the
coefficients of multivariate polynomials, bearing in mind that the order
of coefficients is not determined.

“Pure” extraction and replacement, as in `M[coeffs(M) > 9]` \[which
returns an `mvp` object\] and `M[Mod(coeffs(M)) <= 1] <- value` \[which
modifies `a`\] is implemented experimentally. The code for extraction is
cute but not particularly efficient.

(much of the discussion below appears in the vignette of the
[disordR](https://CRAN.R-project.org/package=disordR) package).

Accessing elements of an `mvp` object is problematic because the order
of the terms of an `mvp` object is not well-defined. This is because the
`map` class of the `STL` does not specify an order for the key-value
pairs (and indeed the actual order in which they are stored may be
implementation dependent). The situation is similar to the `hyper2`
package which uses the `STL` in a similar way.

A `coeffs` object is a vector of coefficients of a `mvp` object. But it
is not a conventional vector; in a conventional vector, we can identify
the first element unambiguously, and the second, and so on. An `mvp` is
a map from terms to coefficients, and a map has no intrinsic ordering:
the maps

    {x -> 1, y -> 3, xy^3 -> 4}

and

    {xy^3 -> 4, x -> 1, y -> 3}

are the same map and correspond to the same multinomial (symbolically,
\\x+3y+4xy^3=4xy^3+x+3y\\). Thus the coefficients of the multinomial
might be `c(1,3,4)` or `c(4,1,3)`, or indeed any ordering. But note that
any particular ordering imposes an ordering on the terms. If we choose
`c(1,3,4)` then the terms are `x,y,xy^3`, and if we choose `c(4,1,3)`
the terms are `xy^3,x,y`.

In the package,
[`coeffs()`](https://robinhankin.github.io/mvp/reference/coeffs.html)
returns an object of class `disord`. This class of object has a slot for
the coefficients in the form of a numeric R vector, but also another
slot which uses hash codes to prevent users from misusing the ordering
of the numeric vector.

For example, a multinomial `x+2y+3z` might have coefficients `c(1,2,3)`
or `c(3,1,2)`. Package idiom to extract the coefficients of a
multivariate polynomial `a` is `coeffs(a)`; but this cannot return a
standard numeric vector because a numeric vector has elements in a
particular order, and the coefficients of a multivariate polynomial are
stored in an implementation-specific (and thus unknown) order.

Suppose we have two multivariate polynomials, `a` as defined as above
with `a=x+2y+3z` and `b=x+3y+4z`. Even though `a+b` is well-defined
algebraically, and `coeffs(a+b)` will return a well-defined `mvp_coeffs`
object, idiom such as `coeffs(a) + coeffs(b)` is not defined because
there is no guarantee that the coefficients of the two multivariate
polynomials are stored in the same order. We might have
`c(1,2,3)+c(1,3,4)=c(2,5,7)` or `c(1,2,3)+c(1,4,3)=c(2,6,6)`, with
neither being more “correct” than the other. In the package,
`coeffs(a) + coeffs(b)` will return an error. In the same way
`coeffs(a) + 1:3` is not defined and will return an error. Further,
idiom such as `coeffs(a) <- 1:3` and `coeffs(a) <- coeffs(b)` are not
defined and will return an error. However, note that
`coeffs(a) + coeffs(a)` and `coeffs(a)+coeffs(a)^2` are fine, these
returning a `mvp_coeffs` object specific to `a`.

Idiom such as `coeffs(a) <- coeffs(a)^2` is fine too, for one does not
need to know the order of the coefficients on either side, so long as
the order is the same on both sides. That would translate into idiomatic
English: “the coefficient of each term of `a` becomes its square”; note
that this operation is insensitive to the order of coefficients. The
whole shebang is intended to make idiom such as
`coeffs(a) <- coeffs(a)%%2` possible (so we can manipulate polynomials
over finite rings, here \\\mathbb{Z}/2\mathbb{Z}\\).

The replacement methods are defined so that an expression like
`coeffs(a)[coeffs(a) > 5] <- 5` works as expected; the English idiom
would be “Replace any coefficient greater than 5 with 5”.

To fix ideas, consider `a <- rmvp(8)`. Extraction presents issues;
consider `coeffs(a)<5`. This object has Boolean elements but has the
same ordering ambiguity as `coeffs(a)`. One might expect that we could
use this to extract elements of `coeffs(a)`, specifically elements less
than 5. However, `coeffs(a)[coeffs(a)<5]` in isolation is meaningless:
what can be done with such an object? However, it makes sense on the
left hand side of an assignment, as long as the right hand side is a
length-one vector. Idiom such as

- coeffs(a)[coeffs(a)<5] <- 4+coeffs(a)[coeffs(a)<5]

- coeffs(a) <- pmax(a,3)

is algebraically meaningful (“Add 4 to any element less than 5”;
“coefficients become the pairwise maximum of themselves and 3”). The
[disordR](https://CRAN.R-project.org/package=disordR) package uses
`pmaxdis()` rather than [`pmax()`](https://rdrr.io/r/base/Extremes.html)
for technical reasons.

So the output of `coeffs(x)` is defined only up to an unknown
rearrangement. The same considerations apply to the output of `vars()`,
which returns a list of character vectors in an undefined order, and the
output of `powers()`, which returns a numeric list whose elements are in
an undefined order. However, even though the order of these three
objects is undefined individually, their ordering is jointly consistent
in the sense that the first element of `coeffs(x)` corresponds to the
first element of `vars(x)` and the first element of `powers(x)`. The
identity of this element is not defined—but whatever it is, the first
element of all three accessor methods refers to it.

Note also that a single term (something like `4a^3*b*c^6`) has the same
issue: the variables are not stored in a well-defined order. This does
not matter because the algebraic value of the term does not depend on
the order in which the variables appear and this term would be
equivalent to `4b*c^6*a^3`.

## Author

Robin K. S. Hankin

## Examples

``` r
(x <- 5+rmvp(6))
#> mvp object algebraically equal to
#> 5 + 2 a c^2 f + 5 b + 5 b c d + 6 b d + 6 c e f^2 + 5 e^3
(y <- 2+rmvp(6))
#> mvp object algebraically equal to
#> 2 + 6 a b + 4 a^3 c f^2 + 2 b + 3 c + 5 c d^2 e^2 + 4 d

coeffs(x)^2
#> A disord object with hash 654c2c4102acef68a89664a25b0ac4aad030bc93 and elements
#> [1] 25  4 25 25 36 36 25
#> (in some order)
coeffs(y) <- coeffs(y)%%3  # fine, all coeffs of y now modulo 3
y
#> mvp object algebraically equal to
#> 2 + a^3 c f^2 + 2 b + 2 c d^2 e^2 + d

coeffs(y) <- 4               
y
#> mvp object algebraically equal to
#> 4 + 4 a^3 c f^2 + 4 b + 4 c d^2 e^2 + 4 d

if (FALSE) { # \dontrun{
coeffs(x) <- coeffs(y)          # not defined, will give an error
coeffs(x) <- seq_len(nterms(x)) # not defined, will give an error
} # }


## "Pure" extraction:
M <- as.mvp("4 -0.1 x + 7 x y z -3 x^5  + 0.3 y^5")
M[coeffs(M)>3]
#> mvp object algebraically equal to
#> 4 + 7 x y z
M[Mod(coeffs(M)) < 1] <- 0
M
#> mvp object algebraically equal to
#> 4 + 7 x y z - 3 x^5
```
