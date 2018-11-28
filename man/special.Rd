\name{special}
\alias{special}
\alias{product}
\alias{homog}
\alias{linear}
\alias{numeric_to_mvp}
\title{Various functions to create simple multivariate polynomials}
\description{
Various functions to create simple mvp objects such as single-term,
homogenous, and constant multivariate polynomials.
}
\usage{
product(v,symbols=letters)
homog(d,power=1)
linear(x,power=1,symbols=letters)
numeric_to_mvp(x)
}
\arguments{
  \item{d}{An integer; generally, the dimension or arity of the resulting mvp}
  \item{v,power}{Integer vector of powers}
  \item{x}{Numeric vector of coefficients}
}
\value{All functions documented here return a mvp object}
\author{Robin K. S. Hankin}
\note{

The functions here are related to their equivalents in the multipol and
spray packages, but are not exactly the same.

Function \code{constant()} is documented at \code{constant.Rd}, but is listed
below for convenience.
}
\seealso{\code{\link{constant}}, \code{\link{zero}}}
\examples{
product(1:3)        #      x * y^2 * z^3
homog(3)            #      x + y + z
homog(3,2)          #      x^2  + xy + xz + y^2 + yz + z^2
linear(1:3)         #      1*x + 2*y + 3*z
constant(5)         #  5
}
\keyword{symbolmath}
