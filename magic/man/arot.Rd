\name{arot}
\alias{arot}
\title{Rotates an array about two specified dimensions}
\description{
Rotates an array about two specified dimensions by any number of 90
degree turns
}
\usage{
arot(a, rights = 1,pair=1:2)
}
\arguments{
  \item{a}{The array to be rotated}
  \item{rights}{Integer; number of right angles to turn}
  \item{pair}{A two-element vector containing the dimensions to rotate
    with default meaning to rotate about the first two dimensions}
}
\author{Robin K. S. Hankin}
\note{
  Function \code{arot()} is not exactly equivalent to octave's
  \code{rotdim()}; in \code{arot()} the order of the elements of
  \code{pair} matters because the rotation is clockwise when viewed
  in the \code{(pair[1],pair[2])} direction.  Compare octave's
  \code{rotdim()} in which \code{pair} is replaced with
  \code{sort(pair)}.

  Note also that the rotation is about the first two dimensions
  specified by \code{pair} but if \code{pair} has more than two elements
  then these dimensions are also permuted.

  Also note that function \code{arot()} does not treat singleton
  dimensions specially.
}
\seealso{\code{\link{arev}}}
\examples{
a <- array(1:16,rep(2,4))
arot(a)
}
\keyword{array}
