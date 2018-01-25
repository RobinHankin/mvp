\name{magic.4np2}
\alias{magic.4np2}
\title{Magic squares of order 4n+2}
\description{
  Produces a magic square of order \eqn{4n+2} using
  Conway's \dQuote{LUX} method
}
\usage{
magic.4np2(m)
}
\arguments{
  \item{m}{returns a magic square of order \eqn{n=4m+2}
    for \eqn{m\geq 1}{m>=1}, using Conway's
    \dQuote{LUX} construction}
}
\references{\url{http://mathworld.wolfram.com/MagicSquare.html}}
\author{Robin K. S. Hankin}
\note{I am not entirely happy with the method used: it's too complicated}
\seealso{\code{\link{magic}}}
\examples{
magic.4np2(1)
is.magic(magic.4np2(3))
}
\keyword{array}
