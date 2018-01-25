\name{diag.off}
\alias{diag.off}
\title{Extracts broken diagonals}
\description{
  Returns broken diagonals of a magic square
}
\usage{
diag.off(a, offset = 0, nw.se = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{a}{Square matrix}
  \item{offset}{vertical offset} 
  \item{nw.se}{Boolean variable with \code{TRUE} meaning trace diagonals
    along the northwest-southeast direction (point \code{[1,n]}
    to \code{[n,1]}).}  }
\details{
  Useful when testing for panmagic squares.  The first element is always
  the unbroken one (ie \code{[1,1]} to \code{[n,n]} if \code{nw.se} is
  \code{TRUE} and \code{[1,n]} to \code{[n,1]} if \code{nw.se} is
  \code{FALSE}.
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{is.panmagic}}}
\examples{
diag.off(magic(10),nw.se=FALSE,offset=0)
diag.off(magic(10),nw.se=FALSE,offset=1)
}
\keyword{array}
