\name{horner}
\alias{horner}
\title{Horner's method}
\description{Horner's method for multivariate polynomials}
\usage{
horner(P,v)
}
\arguments{
  \item{P}{Multivariate polynomial}
  \item{v}{Numeric vector of coefficients}
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{ooom}}}
\examples{
horner("x",1:5)
horner("x+y",1:3)

"x+y+x*y" \%>\% horner(1:3) \%>\% horner(1:2)
}


\keyword{symbolmath}
