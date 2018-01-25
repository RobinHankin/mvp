\name{magic.constant}
\alias{magic.constant}
\title{Magic constant of a magic square or hypercube}
\description{
  Returns the magic constant: that is, the common sum for all rows,
  columns and (broken) diagonals of a magic square or hypercube
}
\usage{
magic.constant(n,d=2,start=1)
}
\arguments{
  \item{n}{Order of the square or hypercube}
  \item{d}{Dimension of hypercube, defaulting to \code{d=2} (a square)}
  \item{start}{Start value.  Common values are 0 and 1}
}
\details{
  If \code{n} is an integer, interpret this as the order of the square
  or hypercube; return \eqn{n({\rm start}+n^d-1)/2}{n(start+n^d-1)/2}.

  If \code{n} is a square or hypercube, return the magic constant for
  a normal array (starting at 1) of the same dimensions as \code{n}.
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{magic}}}
\examples{
magic.constant(4)
}
\keyword{array}
