\name{all_equal_mvp}
\alias{all.equal}
\alias{all_equal_mvp}
\alias{all.equal-methods}
\alias{all.equal,ANY-method}
\alias{all.equal,mvp-method}
\title{Approximate equality of mvp objects}
\description{
Two multivariate polynomials \eqn{x,y} are held to be approxmately equal
if the coefficients of \eqn{x-y} are small compared to the coefficients
of \eqn{x} and \eqn{y} separately.  The comparison is carried out by
\code{base::all.equal()}. 
}
\usage{mvp_all_equal(target, current)}
\arguments{\item{target,current}{Objects of class \code{mvp}}}
\author{Robin K. S. Hankin}
\examples{
a <- rmvp()
a1 <- a + rmvp()/1e5
a2 <- a - rmvp()/1e5
all.equal(a1,a2)
}
