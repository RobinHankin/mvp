\name{Ops.mvp}
\alias{Ops.mvp}
\alias{Ops}
\alias{mvp_negative}
\alias{mvp_times_mvp}
\alias{mvp_times_scalar}
\alias{mvp_plus_mvp}
\alias{mvp_plus_numeric}
\alias{mvp_plus_scalar}
\alias{mvp_power_scalar}
\alias{mvp_eq_mvp}
\alias{mvp_modulo}
\title{Arithmetic Ops Group Methods for \code{mvp} objects}
\description{
  Allows arithmetic operators to be used for
  multivariate polynomials  such as addition, multiplication,
  integer powers, etc.
}
\usage{
\method{Ops}{mvp}(e1, e2)
mvp_negative(S)
mvp_times_mvp(S1,S2)
mvp_times_scalar(S,x)
mvp_plus_mvp(S1,S2)
mvp_plus_numeric(S,x)
mvp_eq_mvp(S1,S2)
mvp_modulo(S1,S2)
}
\arguments{
  \item{e1,e2,S,S1,S2}{Objects of class \code{mvp}}
  \item{x}{Scalar, length one numeric vector}
}
\details{

  The function \code{Ops.mvp()} passes unary and binary arithmetic
  operators \dQuote{\code{+}}, \dQuote{\code{-}}, \dQuote{\code{*}} and
  \dQuote{\code{^}} to the appropriate specialist function.

  The most interesting operator is \dQuote{\code{*}}, which is passed to
  \code{mvp_times_mvp()}.  I guess \dQuote{\code{+}} is quite
  interesting too.

  The caret, as in \code{a^n}, denotes arithmetic exponentiation, as in
  \code{x^3==x*x*x}.  As an experimental feature, this is (sort of)
  vectorised: if \code{n} is a vector, then \code{a^n} returns the sum
  of \code{a} raised to the power of each element of {n}.  For example,
  \code{a^c(n1,n2,n3)} is \code{a^n1 + a^n2 + a^n3}.  Internally,
  \code{n} is tabulated in the interests of efficiency, so
  \code{a^c(0,2,5,5,5,) = 1 + a^2 + 3a^5} is evaluated with only a
  single fifth power.  Similar functionality is implemented in the
  \CRANpkg{freealg} package.

}
\value{

  The high-level functions documented here return an object of
  \code{mvp}, the low-level functions documented at \code{lowlevel.Rd}
  return lists.   But don't use the low-level functions.

}
\author{Robin K. S. Hankin}
\note{Function \code{mvp_modulo()} is distinctly sub-optimal and
\code{inst/mvp_modulo.Rmd} details ideas for better implementation.}
\seealso{\code{\link{lowlevel}}}
\examples{
(p1 <- rmvp(3))
(p2 <- rmvp(3))

p1*p2

p1+p2

p1^3


p1*(p1+p2) == p1^2+p1*p2  # should be TRUE

}
\keyword{symbolmath}
