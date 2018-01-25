\name{aplus}
\alias{aplus}
\title{Generalized array addition}
\description{

  Given two arrays \code{a} and \code{b} with
  \code{length(dim(a))==length(dim(b))}, return a matrix with
  dimensions \code{pmax(dim(a),dim(b))} where \dQuote{overlap}
  elements are \code{a+b}, and the other elements are either 0, a, or
  b according to location.  See details section.
                                                
}
\usage{
aplus(...)
}
\arguments{
  \item{\dots}{numeric or complex arrays}
}
\details{
  The function takes any number of arguments (the binary operation is
  associative).

  The operation of \code{aplus()} is understandable by examining the
  following \strong{pseudo}code:

  \itemize{
    \item \code{outa <- array(0,pmax(a,b))}
    \item \code{outb <- array(0,pmax(a,b))}
    \item \code{outa[1:dim(a)] <- a}
    \item \code{outb[1:dim(a)] <- b}
    \item \code{return(outa+outb)}
  }

  See how \code{outa} and \code{outb} are the correct size and the
  appropriate elements of each are populated with \code{a} and \code{b}
  respectively.  Then the sum is returned.
  
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{apad}}}
\examples{
a <- matrix(1:10,2,5)
b <- matrix(1:9,3,3)
aplus(a,b,b)
  
}
\keyword{ array }
