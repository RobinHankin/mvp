\name{minmax}
\alias{minmax}
\title{are all elements of a vector identical?}
\description{
Returns \code{TRUE} if and only if all elements of a vector are identical.
}
\usage{
minmax(x, tol=1e-6)
}
\arguments{
  \item{x}{Vector to be tested}
  \item{tol}{Relative tolerance allowed}
}
\details{
  If \code{x} is an integer, exact equality is required.  If real or
  complex, a relative tolerance of \code{tol} is required.  Note that
  functions such as \code{is.magic()} and \code{is.semimagichypercube()}
  use the default value for \code{tol}.  To change this, 
  define a new Boolean function that tests the sum to the required
  tolerance, and set \code{boolean} to \code{TRUE}
}
\author{Robin K. S. Hankin}
\seealso{is.magic()}
\examples{
data(Ollerenshaw)
minmax(subsums(Ollerenshaw,2))  #should be TRUE, as per is.2x2.correct()
}
\keyword{array}

