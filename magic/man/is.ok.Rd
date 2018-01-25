\name{is.ok}
\alias{is.ok}
\title{does a vector have the sum required to be a row or column of a
  magic square?}
\description{
  Returns \code{TRUE} if and only if \code{sum(vec)==magic.constant(n,d=d))}
}
\usage{
is.ok(vec, n=length(vec), d=2)
}
\arguments{
  \item{vec}{Vector to be tested}
  \item{n}{Order of square or hypercube.  Default assumes order is equal
    to length of \code{vec}}
\item{d}{Dimension of square or hypercube.  Default of 2 corresponds to a square}
}
\author{Robin K. S. Hankin}
\examples{
 is.ok(magic(5)[1,])

}
\keyword{array}

