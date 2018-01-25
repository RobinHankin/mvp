\name{do.index}
\alias{do.index}
\title{Apply a function to array element indices}
\description{
 Given a function \code{f()} that takes a vector of indices, and an
 array of arbitrary dimensions, apply \code{f()} to the elements of \code{a}
}
\usage{
do.index(a, f, ...)
}
\arguments{
  \item{a}{Array}
  \item{f}{Function that takes a vector argument of the same length as
    \code{dim(a)}}
  \item{...}{Further arguments supplied to \code{f()}}
}
\value{
Returns a matrix of the same dimensions as \code{a}
}
\author{Robin K. S. Hankin, with improvements by  Gabor Grothendieck and
  Martin Maechler, via the R help list}
\note{Tamas Papp suggests the one-liner
\code{function(a, f, ...) {
     array(apply(as.matrix(expand.grid(lapply(dim(a),seq_len),KEEP.OUT.ATTRS=FALSE)),1,f,
...),dim(a))}} which is functionally identical to \code{do.index()}; but
it is no faster than the version implemented in the package, and (IMO)
is harder to read.

Further note that function \code{arow()} is much much faster than
\code{do.index()}; it is often possible to rephrase a call to
\code{do.index()} as a call to \code{arow()}; do this where possible
unless the additional code opacity outweighs the speed savings.
}   
\seealso{\code{\link{arow}}}
\examples{
a <- array(0,c(2,3,4))
b <- array(rpois(60,1),c(3,4,5))

f1 <- function(x){sum(x)}
f2 <- function(x){sum((x-1)^2)}
f3 <- function(x){b[t(x)]}
f4 <- function(x){sum(x)\%\%2}
f5 <- function(x,u){x[u]}

do.index(a,f1)    # should match   arow(a,1)+arow(a,2)+arow(a,3)
do.index(a,f2)
do.index(a,f3)    # same as  apltake(b,dim(a))
do.index(a,f4)    # Male/female toilets at NOC
do.index(a,f5,2)  # same as  arow(a,2)
}
\keyword{math}
