\name{recurse}
\alias{recurse}
\title{Recursively apply a permutation}
\description{
Recursively apply a permutation to a vector an arbitrary number of
times.  Negative times mean apply the inverse permutation.
}
\usage{
recurse(perm, i, start = seq_along(perm))
}
\arguments{
  \item{perm}{Permutation (integers 1 to \code{length(start)} in some order)}
  \item{start}{Start vector to be permuted}
  \item{i}{Number of times to apply the permutation.  \code{i=0} gives
    \code{start} by definition and negative values use the inverse
    permutation}
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{hudson}}}
\examples{

n <- 15
noquote(recurse(start=letters[1:n],perm=shift(1:n),i=0))
noquote(recurse(start=letters[1:n],perm=shift(1:n),i=1))
noquote(recurse(start=letters[1:n],perm=shift(1:n),i=2))

noquote(recurse(start=letters[1:n],perm=sample(n),i=1))
noquote(recurse(start=letters[1:n],perm=sample(n),i=2))

}

\keyword{array}
