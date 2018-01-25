\name{apl}
\alias{apl}
\alias{take}
\alias{apldrop}
\alias{apltake}
\alias{apldrop<-}
\alias{apltake<-}
\title{Replacements for APL functions take and drop}
\description{
Replacements for APL functions take and drop
}
\usage{
apldrop(a, b, give.indices=FALSE)
apldrop(a, b) <- value
apltake(a, b, give.indices=FALSE)
apltake(a, b) <- value
}
\arguments{
  \item{a}{Array}
  \item{b}{Vector of number of indices to take/drop.  Length of \code{b}
    should not exceed \code{length(dim(a))}; if it does, an error is
    returned} 
  \item{give.indices}{Boolean, with default \code{FALSE} meaning to
    return the appropriate subset of array \code{a}, and \code{TRUE}
    meaning to return the list of the selected elements in each of the
    dimensions.  Setting to \code{TRUE} is not really intended for the
    end-user, but is used in the code of \code{apltake<-()} and
    \code{apldrop<-()}} 
  \item{value}{elements to replace}
}
\details{
  \code{apltake(a,b)} returns an array of the same dimensionality as
  \code{a}.  Along dimension \code{i}, if \code{b[i]>0}, the first
  \code{b[i]} elements are retained; if \code{b[i]<0}, the last
  \code{b[i]} elements are retained.

  \code{apldrop(a,b)} returns an array of the same dimensionality as 
  \code{a}.  Along dimension \code{i}, if \code{b[i]>0}, the first
  \code{b[i]} elements are dropped if \code{b[i]<0}, the last
  \code{b[i]} elements are dropped.

  These functions do not drop singleton dimensions.  Use \code{drop()}
  if this is desired.
}
\author{Robin K. S. Hankin}
\examples{
a <- magichypercube.4n(m=1)
apltake(a,c(2,3,2))
apldrop(a,c(1,1,2))

b <- matrix(1:30,5,6)
apldrop(b,c(1,-2)) <- -1

b <- matrix(1:110,10,11)
apltake(b,2) <- -1
apldrop(b,c(5,-7)) <- -2
b

}
\keyword{array}
