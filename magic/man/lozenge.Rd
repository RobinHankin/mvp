\name{lozenge}
\alias{lozenge}
\title{Conway's lozenge algorithm for magic squares}
\description{
  Uses John Conway's lozenge algorithm to produce magic squares of
  odd order.
}
\usage{
lozenge(m)
}
\arguments{
  \item{m}{magic square returned is of order \code{n=2m+1}}
}
\author{Robin Hankin}
\seealso{\code{\link{magic.4np2}}}
\examples{
lozenge(4)
all(sapply(1:10,function(n){is.magic(lozenge(n))}))
}
\keyword{array}
