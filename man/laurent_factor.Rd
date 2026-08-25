\name{laurent_factor}
\alias{laurent_factor}
\title{Laurent factor}
\description{
Given a multivariate polynomial \eqn{P}, possibly with symbols raised to
a negative power, return the minimal one-term polynomial required to
lift \eqn{P} to a standard multivariate polynomial: \code{P *
laurent_factor(P)} is guaranteed to have no negative powers.
}
\usage{laurent_factor(P)}
\arguments{\item{P}{Object of class \code{mvp}}}
\details{
The returned polynomial has coefficient 1.  
}
\author{Robin K. S. Hankin}
\examples{

x <- as.mvp("x")
y <- as.mvp("y")
P <- 2 + 3*x*y^7 - 4*x/y^2 + 7*y^4/x
P
laurent_factor(P)


laurent_factor(invert(rmvp()))

P <- rmvp() * invert(rmvp())

P * laurent_factor(P)
}
