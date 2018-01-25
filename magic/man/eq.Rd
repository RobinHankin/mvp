 \name{eq}
\alias{eq}
\alias{ne}
\alias{gt}
\alias{lt} 
\alias{ge}
\alias{le}
\alias{\%eq\%}
\alias{\%ne\%}
\alias{\%gt\%}
\alias{\%lt\%}
\alias{\%ge\%}
\alias{\%le\%}
\title{Comparison of two magic squares}
\description{
  Compares two magic squares according to Frenicle's method.
  Mnemonic is the old Fortran \dQuote{.GT.}  (for \dQuote{Greater Than})
  comparison et seq.

To compare magic square \code{a} with magic square \code{b}, their
elements are compared in rowwise order: \code{a[1,1]} is compared with
\code{b[1,1]}, then \code{a[1,2]} with \code{b[1,2]}, up to
\code{a[n,n]}.  Consider the first element that is different, say
\code{[i,j]}.  Then \code{a<b} if \code{a[i,j]<b[i,j]}.

The generalization to hypercubes is straightforward: comparisons are
carried out natural order.
}
\usage{
eq(m1, m2)
ne(m1, m2)
gt(m1, m2)
lt(m1, m2)
ge(m1, m2)
le(m1, m2)
m1 \%eq\% m2
m1 \%ne\% m2
m1 \%gt\% m2
m1 \%lt\% m2
m1 \%ge\% m2
m1 \%le\% m2
}
\arguments{
  \item{m1}{First magic square}
  \item{m2}{Second magic square}
}
\author{Robin K. S. Hankin}
\note{Rather clumsy function definition due to the degenerate case of 
  testing two identical matrices (\code{min(NULL)} is undefined).

  The two arguments are assumed to be matrices of the same size.  If
  not, an error is given.  
}
\seealso{\code{\link{as.standard}}}
\examples{
magic(4) \%eq\% magic.4n(1)
eq(magic(4) , magic.4n(1))
}
\keyword{array}
