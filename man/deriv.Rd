\name{deriv}
\alias{deriv}
\alias{aderiv}
\alias{deriv.mvp}
\alias{deriv_mvp}
\alias{aderiv.mvp}
\alias{aderiv_mvp}
\title{Differentiation of \code{mvp} objects}
\description{
Differentiation of \code{mvp} objects}
\usage{
\method{deriv}{mvp}(expr, v, ...)
\method{aderiv}{mvp}(expr, ...)
}
\arguments{
  \item{expr}{Object of class \code{mvp}}
  \item{v}{Character vector.  Elements denote variables to differentiate
    with respect to}
  \item{...}{Further arguments.  In \code{deriv()}, a non-negative
    integer argument specifies the order of the differential, and in
    \code{aderiv()} the argument names specify the differentials and
    their values their respective orders}
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{taylor}}}
\details{

  \code{deriv(S,v)} returns \eqn{\frac{\partial^r S}{\partial
  v_1\partial v_2\ldots\partial v_r}}{d^rS/dv1...dvr}.  Here, \code{v}
  is a (character) vector of symbols.

  \code{deriv(S,v,n)} returns the n-th derivative of \code{S} with
  respect to symbol \code{v}, \eqn{\frac{\partial^n S}{\partial
  v^n}}{d^nS/dv^n}.

  \code{aderiv()} uses the ellipsis construction with the names of the
  argument being the variable to be differentiated with respect to.
  Thus \code{aderiv(S,x=1,y=2)} returns \eqn{\frac{\partial^3
  S}{\partial x\partial y^2}}{d^3S/dxdy^2}.

}
\examples{

(p <- rmvp(10,4,15,5))
deriv(p,"a")
deriv(p,"a",3)
deriv(p,letters[1:3])
deriv(p,rev(letters[1:3]))  # should be the same

aderiv(p,a=1,b=2,c=1)

## verify the chain rule:
x <- rmvp(7,symbols=6)
v <- allvars(x)[1]
s <- as.mvp("1  +  y  -  y^2 zz  +  y^3 z^2")
LHS <- subsmvp(deriv(x,v)*deriv(s,"y"),v,s)   # dx/ds*ds/dy
RHS <- deriv(subsmvp(x,v,s),"y")              # dx/dy

LHS - RHS # should be zero

}
\keyword{symbolmath}
