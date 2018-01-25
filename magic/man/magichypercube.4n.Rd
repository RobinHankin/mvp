\name{magichypercube.4n}
\alias{magichypercube.4n}
\title{Magic hypercubes of order 4n}
\description{
Returns magic hypercubes of order 4n and any dimension.
}
\usage{
magichypercube.4n(m, d = 3)
}
\arguments{
  \item{m}{Magic hypercube produced of order \eqn{n=4m}}
  \item{d}{Dimensionality of cube}
}
\details{
Uses a rather kludgy (but vectorized) method.  I am not 100\% sure that
the method does in fact produce magic squares for all orders and dimensions.
}
\author{Robin K. S. Hankin}
\examples{
magichypercube.4n(1,d=4)
magichypercube.4n(2,d=3)
}
\keyword{array}
