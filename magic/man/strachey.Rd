\name{strachey}
\alias{strachey}
\title{Strachey's algorithm for magic squares}
\description{
  Uses Strachey's algorithm to produce magic squares of
  singly-even order.
}
\usage{
strachey(m, square=magic.2np1(m))
}
\arguments{
  \item{m}{magic square produced of order \code{n=2m+1}}
  \item{square}{magic square of order \code{2m+1} needed for Strachey's
    method.  Default value gives the standard construction, but
    the  method will work with any odd order magic square}
}
\details{
  Strachey's method essentially places four identical magic squares
  of order \eqn{2m+1} together to form one of \eqn{n=4m+2}.  Then
  \eqn{0,n^2/4,n^2/2,3n^2/4} is added to each
  square; and finally, certain squares are swapped from the top
  subsquare to the bottom subsquare.

  See the final example for an illustration of how this works,
  using a zero matrix as the submatrix.  Observe how some 75s are
  swapped with some 0s, and some 50s with some 25s.  
}
  
\author{Robin K. S. Hankin}
\seealso{\code{\link{magic.4np2}},\code{\link{lozenge}}}
\examples{
 strachey(3)
 strachey(2,square=magic(5))

 strachey(2,square=magic(5)) \%eq\%  strachey(2,square=t(magic(5)))
 #should be FALSE

 #Show which numbers have been swapped:
 strachey(2,square=matrix(0,5,5))

 #It's still magic, but not normal:
  is.magic(strachey(2,square=matrix(0,5,5)))
}
\keyword{array}
