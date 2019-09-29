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
  object.  But idiom such as \code{coeffs(a) + coeffs(b)} is not defined
  and will return an error, because the order of the coefficients is
  implementation-specific.  Note that \code{coeffs(a) + coeffs(a)} is
  fine.

  Idiom such as \code{coeffs(a) <- coeffs(a)^2} is fine too, as one does
  not need to know the order of the coefficients on either side, so long
  as the order is the same on both sides.  That would translate to
  \dQuote{the coefficient of each term of \code{a} becomes its square},
  an operation that is insensitive to the order of coefficients.  The
  whole shebang is intended to make idiom such as \code{coeffs(a) <-
  coeffs(a)\%\%2} possible (so we can manipulate polynomials over finite
  rings, here \eqn{Z/2Z}).  Also note that \code{coeffs(a) <-
  rev(coeffs(a))} is disallowed.

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
