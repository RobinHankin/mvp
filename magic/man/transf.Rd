\name{transf}
\alias{transf}
\title{Frenicle's equivalent magic squares}
\description{
For a given magic square, returns one of the eight squares 
whose Frenicle's standard form is the same.
}
\usage{
transf(a, i)
}
\arguments{
  \item{a}{Magic square}
  \item{i}{Integer, considered modulo 8.  Specifying 0-7 gives a
    different magic square}
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{is.standard}}}
\examples{
a <- magic(3)
identical(transf(a,0),a)

transf(a,1)
transf(a,2)

transf(a,1) \%eq\% transf(a,7)

}
\keyword{array}
