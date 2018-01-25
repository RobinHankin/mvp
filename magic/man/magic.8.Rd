\name{magic.8}
\alias{magic.8}
\title{Regular magic squares of order 8}
\description{
Returns all 90 regular magic squares of order 8
}
\usage{
magic.8(...)
}
\arguments{
  \item{\dots}{ignored}
}
\value{
Returns an array of dimensions \code{c(8,8,90)} of which each slice is
an 8-by-8 magic square.
}
\references{\url{http://www.grogono.com/magic/index.php}}
\author{Robin K. S. Hankin}
\examples{
\dontrun{
h <- magic.8()
h[,,1]
is.magic(h[,,4])
}

}
\keyword{array}
