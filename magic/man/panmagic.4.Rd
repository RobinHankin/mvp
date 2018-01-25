\name{panmagic.4}
\alias{panmagic.4}
\title{Panmagic squares of order 4}
\description{
Creates all fundamentally different panmagic squares of order 4.
}
\usage{
panmagic.4(vals = 2^(0:3))
}
\arguments{
  \item{vals}{a length four vector giving the values which are combined
    in each of the \eqn{2^4}{2^4} possible ways.  Thus
    \code{vals=2^sample(0:3)} always gives a normal square
    (0-15 in binary).}
}

\references{\url{http://www.grogono.com/magic/index.php}}
\author{Robin K. S. Hankin}
\seealso{\code{\link{panmagic.6npm1}}}
\examples{
panmagic.4()
panmagic.4(2^c(1,3,2,0))
panmagic.4(10^(0:3))
}
\keyword{array}
