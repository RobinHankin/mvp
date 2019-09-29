\name{Ops.coeffs}
\alias{Ops.coeffs}
\alias{Ops.mvp_coeffs}
\alias{hash}
\alias{as_coeffs}
\alias{print.coeffs}
\alias{print.mvp_coeffs}
\title{Arithmetic Ops Group Methods for \code{coeffs} objects}
\description{
  Allows arithmetic operators to be used for the coefficients of
  multivariate polynomials, bearing in mind that the order of
  coefficients is not determined. 
}
\usage{
\method{Ops}{mvp_coeffs}(e1, e2=NULL)
as_coeffs(v,h)
hash(x)
\method{print}{mvp_coeffs}(x, ...)
}
\arguments{
  \item{x,e1,e2}{Objects of class \code{coeffs}}
\item{...}{Further arguments}
\item{v}{Vector of coefficients}
\item{h}{Hash code}
}
\details{

  A \code{coeffs} object is a vector of coefficients of a \code{mvp}
  object.  But it is not a conventional vector; in a conventional
  vector, we can identify the first element unambiguously, and the
  second, and so on.  An \code{mvp} is a map from terms to coefficients,
  and a map has no intrinsic ordering: the maps

  \preformatted{{x -> 1, y -> 3, xy^3 -> 4}}

  and \preformatted{{xy^3 -> 4, x -> 1, y -> 3}}
  
  are the same map and correspond to the same multinomial (symbolically,
  \eqn{x+3y+4xy^3=4xy^3+x+3y}).  Thus the coefficients of the
  multinomial might be \code{c(1,3,4)} or \code{c(4,1,3)}, or indeed any
  ordering.  But note that any particular ordering imposes an ordering
  on the terms.  If we choose \code{c(1,3,4)} then the terms are
  \code{x,y,xy^3}, and if we choose \code{c(4,1,3)} the terms are
  \code{xy^3,x,y}.

  Likewise a multinomial \code{x+2y+3z} might have coefficients
  \code{c(1,2,3)} or \code{c(3,1,2)}
  
  So idiom such as \code{coeffs(a) + coeffs(b)} is not defined: we might
  have \code{c(1,3,4)+c(1,2,3)=c(1,5,7)} or
  \code{c(1,3,4)+c(1,3,2)=c(1,6,6)}, with neither one being more
  \dQuote{correct} than the other.  In the package, \code{coeffs(a) +
  coeffs(b)} will return an error.  In the same way \code{coeffs(a) +
  1:3} is not defined and will return an error. 

  In the same way, idiom such as \code{coeffs(a) <- 1:3} and
  \code{coeffs(a) <- coeffs(b)} are not defined and will return an
  error.

  However, note that \code{coeffs(a) + coeffs(a)} is fine.  Idiom such
  as \code{coeffs(a) <- coeffs(a)^2} is fine too, for one does not need
  to know the order of the coefficients on either side, so long as the
  order is the same on both sides.  That would translate into idiomatic
  English: \dQuote{the coefficient of each term of \code{a} becomes its
  square}; note that this operation is insensitive to the order of
  coefficients.  The whole shebang is intended to make idiom such as
  \code{coeffs(a) <- coeffs(a)\%\%2} possible (so we can manipulate
  polynomials over finite rings, here \eqn{Z/2Z}).  Also note that
  \code{coeffs(a) <- rev(coeffs(a))} is disallowed (as indeed is
  \code{coeffs(a) <- sample(coeffs(a))}, although arguably that should
  be OK).

  The function \code{Ops.coeffs()} passes unary and binary arithmetic
  operators to the appropriate specialist function using a system of
  hash code (created by function \code{hash()}) that prevents one from
  misusing the arbitrary ordering of the coefficients returned by
  \code{coeffs()}.

}
\author{Robin K. S. Hankin}
\seealso{\code{\link{Ops.mvp}}}
\examples{

x <- 5+rmvp(6)
y <- 2+rmvp(6)
z <- 2+rmvp(6)


coeffs(x)^2
coeffs(z) <- coeffs(z)\%\%3  # fine, all coeffs of z now modulo 3
coeffs(z) <- 4               # also fine, all coeffs  of z now modulo 3

\dontrun{
coeffs(x) <- coeffs(y)          # not defined, will give an error
coeffs(x) <- seq_len(nterms(x)) # not defined, will give an error
}

}
\keyword{symbolmath}
