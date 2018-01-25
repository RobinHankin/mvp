\name{force.integer}
\alias{force.integer}
\title{Integerize array elements}
\description{
Returns an elementwise \code{as.integer}-ed array.  All magic squares
should have integer elements.
}
\usage{
force.integer(x)
}
\arguments{
  \item{x}{Array to be converted}
}
\author{Robin K. S. Hankin}
\note{
  Function \code{force.integer()} differs from \code{as.integer()} as
  the latter returns an integer vector, and the former returns an array
  whose elements are  integer versions of \code{x}; see examples section
  below. 
}
\examples{
a <- matrix(rep(1,4),2,2)
force.integer(a)
as.integer(a)
}
\keyword{array}
