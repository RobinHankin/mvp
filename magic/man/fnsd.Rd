\name{fnsd}
\alias{fnsd}
\title{First non-singleton dimension}
\description{
Given an array, returns the first non-singleton dimension.  Useful for
emulating some of Matlab / Octave's multidimensional functions.

If \code{n} is supplied, return the first \code{n} nonsingleton dimensions.
}
\usage{
fnsd(a,n)
}
\arguments{
  \item{a}{An array}
  \item{n}{Integer.  Return the first \code{n} nonsingleton dimensions}
}
\value{
  Returns an integer vector with elements in the range \code{1} to
  \code{length(dim(a))}.
}
\author{Robin K. S. Hankin}
\note{
  Treats zero-extent dimensions as singletons.

  Case \code{n=0} now treated sensibly (returns a zero-length vector).
  
  }
\seealso{\code{\link{arev}}}
\examples{
a <- array(1:24,c(1,1,1,1,2,1,3,4))
fnsd(a)
fnsd(a,2)
}
\keyword{array}



