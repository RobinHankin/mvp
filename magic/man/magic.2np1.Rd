\name{magic.2np1}
\alias{magic.2np1}
\title{Magic squares of odd order}
\description{
  Function to create magic squares of odd order 
}
\usage{
magic.2np1(m, ord.vec = c(-1, 1), break.vec = c(1, 0), start.point=NULL)
}
\arguments{
  \item{m}{creates a magic square of order \eqn{n=2m+1}}
  \item{ord.vec}{ordinary vector.  Default value of \code{c(-1,1) }
    corresponds to the usual northeast direction}
  \item{break.vec}{break vector.  Default of \code{c(1,0)} corresponds to the
    usual south direction}
  \item{start.point}{Starting position for the method (ie coordinates of
    unity).  Default value of NULL corresponds to row 1, column \code{m}}
}
\references{Written up in loads of places.  The method (at least with
  the default ordinary and break vectors) seems to have been known since
  at least the Renaissance.

  Benson and Jacoby, and the Mathematica website, discuss the problem
  with nondefault ordinary and break vectors.
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{magic}}, \code{\link{magic.prime}}}
\examples{
magic.2np1(1)
f <- function(n){is.magic(magic.2np1(n))}
all(sapply(1:20,f))

is.panmagic(magic.2np1(5,ord.vec=c(2,1),break.vec=c(1,3)))
}
\keyword{array}
