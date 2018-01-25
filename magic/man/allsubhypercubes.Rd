\name{allsubhypercubes}
\alias{allsubhypercubes}
\title{Subhypercubes of magic hypercubes}
\description{
Extracts all subhypercubes from an n-dimensional hypercube.
}
\usage{
allsubhypercubes(a)
}
\arguments{
  \item{a}{The magic hypercube whose subhypercubes are computed}
}
\value{
  Returns a list, each element of which is a subhypercube.  Note that
  major diagonals are also returned (as n-by-1 arrays).

  The names of the list are the extracted subhypercubes.  Consider
  \code{a <- magichypercube.4n(1,d=4)} (so n=4) and if \code{jj <-
  allsubhypercubes(a)}, consider \code{jj[9]}.  The name of
  \code{jj[9]} is \code{"n-i+1,i,i,"}; its value is a square matrix.  The
  columns of \code{jj[9]} may be recovered by \code{a[n-i+1,i,i,]}
  with \eqn{i=1\ldots n}{i=1...n} (\strong{NB}: that is,
  jj[[9]] == \code{cbind(a[n-1+1,1,1,],
  a[n-2+1,2,2,], a[n-3+1,3,3,], a[n-4+1,4,4,])} where \code{n=4}).

  The list does not include the whole array.
}
\author{Robin K. S. Hankin}
\note{This function is a dog's dinner.  It's complicated, convoluted,
  and needs an absurd use of the \code{eval(parse(text=...))}
  construction.  Basically it sucks big time.

  BUT\ldots I cannot for the life of me see a better way that gives the
  same results, without loops, on hypercubes of arbitrary dimension.

  On my 256MB Linuxbox, \code{allsubhypercubes()} cannot cope with
  \code{d} as high as 5, for \code{n=4}.  Heigh ho.

  The term \dQuote{subhypercube} does not include diagonally oriented
  entities at \code{is.magichypercube}.  But it does here.
  
  }
\seealso{\code{\link{is.perfect}}}
\examples{
  a <- magichypercube.4n(1,d=4)
  allsubhypercubes(a)
}
\keyword{array}
