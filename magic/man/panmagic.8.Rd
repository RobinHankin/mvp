\name{panmagic.8}
\alias{panmagic.8}
\title{Panmagic squares of order 8}
\description{
Produces each of a wide class of order 8 panmagic squares
}
\usage{
panmagic.8(chosen = 1:6, vals = 2^(0:5))
}
\arguments{
  \item{chosen}{Which of the magic carpets are used in combination}
  \item{vals}{The values combined to produce the magic square.  Choosing
  \code{0:5} gives a normal magic square.}
}
\references{\url{http://www.grogono.com/magic/index.php}}
\author{Robin K. S. Hankin}
\note{
  Not all choices for \code{chosen} give normal magic squares.  There
  seems to be no clear pattern.  See website in references for details.
}
\seealso{\code{\link{panmagic.4}}}
\examples{
is.panmagic(panmagic.8(chosen=2:7))
is.normal(panmagic.8(chosen=2:7))
is.normal(panmagic.8(chosen=c(1,2,3,6,7,8)))

#to see the twelve basis magic carpets, set argument 'chosen' to each
#integer from 1 to 12 in turn, with vals=1:

panmagic.8(chosen=1,vals=1)-1
image(panmagic.8(chosen=12,vals=1))

}
\keyword{array}

