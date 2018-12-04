# mvp: fast symbolic multivariate polynomials in R

Multivariate polynomials are intereresting and useful objects.  Here I
present the `mvp` package which hopefully improves upon previous R
functionality provided by the packages `multipol`, `mpoly`, and
`spray`.  The `mvp` package uses the excellent print and coercion
methods of the `mpoly` package.  `mvp` is theoretically comparable in
speed to the `spray` package.

The `mvp` package uses the STL `map` class of `C++` for efficiency,
which has the downside that the order of the terms, and the order of
the symbols within each term, is undefined.  This does not matter as
the mathematical value of a multivariate polynomial is unaffected by
reordering; and the print method (taken from `mpoly`) does a good job
in producing human-readable output.


```
library("mvp")
P <- as.mvp("1+x^2 + a*x^3 + y*a")
P
mvp object algebraically equal to
1  +  a x^3  +  a y  +  x^2

## Arithmetic

S <- as.mvp("x^7 +4y")
P+S
mvp object algebraically equal to
1  +  a x^3  +  a y  +  x^2  +  x^7  +  4 y

P-S
mvp object algebraically equal to
1  +  a x^3  +  a y  +  x^2  -  x^7  -  4 y

P*S
mvp object algebraically equal to
4 a x^3 y  +  a x^7 y  +  a x^10  +  4 a y^2  +  4 x^2 y  +  x^7  +  x^9  +  4 y

P^3
mvp object algebraically equal to
1  +  6 a x^2 y  +  3 a x^3  +  3 a x^4 y  +  6 a x^5  +  3 a x^7  +  3 a y  +  3 a^2 x^2 y^2  + 
   6 a^2 x^3 y  +  6 a^2 x^5 y  +  3 a^2 x^6  +  3 a^2 x^8  +  3 a^2 y^2  +  3 a^3 x^3 y^2  +
   3 a^3 x^6 y  +  a^3 x^9  +  a^3 y^3  +  3 x^2  +  3 x^4  +  x^6

# Substitution

subs(P,a=1,y=3)
mvp object algebraically equal to
4  +  x^2  +  x^3

subsmvp(P,'x',as.mvp("1+t^3"))
mvp object algebraically equal to
2  +  a  +  3 a t^3  +  3 a t^6  +  a t^9  +  a y  +  2 t^3  +  t^6


```
