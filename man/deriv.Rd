\name{deriv}
\alias{deriv}
\alias{aderiv}
\alias{deriv.mvp}
\alias{deriv_mvp}
\alias{aderiv.mvp}
\alias{aderiv_mvp}
\title{Differentiation of mvp objects}
\description{
Differentiation of mvp objects}
\usage{
\method{deriv}{mvp}(expr, v, ...)
\method{aderiv}{mvp}(expr, n, ...)
}
\arguments{
  \item{expr}{mvp object}
  \item{v}{Character vector.  Elements denote variables to differentiate with respect to}
  \item{n}{Numeric vector indicating number of times to differentiate
    with respect to; names}
  \item{...}{Further arguments}
}
\value{Returns its argument invisibly}
\author{Robin K. S. Hankin}

\details{

  Function \code{deriv(S,v)} returns \eqn{\frac{\partial^r S}{\partial
  v_1\partial v_2\ldots\partial v_r}}{d^rS/dv1...dvr}.

  Function \code{aderiv(S,n)} returns \eqn{\frac{\partial^t
  S}{\partial^{n_1}v_1\partial^{n_2}v_2\ldots\partial^{n_r}v_r}}{ommitted}.

Function \code{aderiv()} in the \pkg{skimpy} package is loosely based
on the function of the same name in the \pkg{spray} package.

}
\examples{
p <- rmvp(10,9,9,letters[1:4])
deriv(p,letters[1:3])
deriv(p,rev(letters[1:3]))  # should be the same

aderiv(p,c(a=3,b=4,c=2))

jj <- c(a=1,b=2,c=3)

aderiv(p,jj) - aderiv(rev(jj)) # should be zero

}
\keyword{symbolmath}
