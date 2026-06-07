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

laurent_factor(invert(rmvp()))

P <- rmvp() * invert(rmvp())

P * laurent_factor(P)
}
