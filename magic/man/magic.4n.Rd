\name{magic.4n}
\alias{magic.4n}
\title{Magic squares of order 4n}
\description{
  Produces an associative magic square of order \eqn{4n} using the
  delta-x method.
}
\usage{
magic.4n(m)
}
\arguments{
  \item{m}{Order \eqn{n}{n} of the square is given by \eqn{n=4m}}
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{magic}}}
\examples{
magic.4n(4)
is.magic(magic.4n(5))
}
\keyword{array}

