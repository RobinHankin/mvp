\name{magic.prime}
\alias{magic.prime}
\title{Magic squares prime order}
\description{
Produces magic squares of prime order using the standard method
}
\usage{
magic.prime(n,i=2,j=3)
}
\arguments{
  \item{n}{The order of the square}
  \item{i}{row number of increment}
  \item{j}{column number of increment}
}
\details{
Claimed to work for prime order, but I've tried it (with the defaults
for \code{i} and \code{j}) for many composite integers of the
form \eqn{6n+1}{6n+1} and \eqn{6n-1}{6n-1} and found no exceptions;
indeed, they all seem to be panmagic.  It is not clear to me 
when the process works and when it doesn't.  
}
\references{\url{http://www.magic-squares.de/general/general.html}}
\author{Robin K. S. Hankin}
\examples{
magic.prime(7)
f <- function(n){is.magic(magic.prime(n))}
all(sapply(6*1:30+1,f))
all(sapply(6*1:30-1,f))

is.magic(magic.prime(9,i=2,j=4),give.answers=TRUE)
magic.prime(7,i=2,j=4)
}
\keyword{array}
