\name{panmagic.6npm1}
\alias{panmagic.4n}
\alias{panmagic.6npm1}
\alias{panmagic.6np1}
\alias{panmagic.6nm1}
\title{Panmagic squares of order 4n, 6n+1 and 6n-1}
\description{
  Produce a panmagic square of order \eqn{4n} or \eqn{6n\pm 1}{6n+/-1} using a
  classical method
}
\usage{
panmagic.6npm1(n)
panmagic.6np1(m)
panmagic.6nm1(m)
panmagic.4n(m)
}
\arguments{
  \item{m}{Function \code{panmagic.6np1(m)} returns a panmagic square of
    order \eqn{n=6m+1} for \eqn{m\geq 1}{m>=1}, and function
    \code{panmagic.6nm1(m)} returns a panmagic square of order
    \eqn{n=6m-1} for \eqn{m\geq 1}{m>=1}, using a classical method.

    Function \code{panmagic.4n(m)} returns a magic square of order
  \eqn{n=4m}} \item{n}{Function \code{panmagic.6npm1(n)} returns a
  panmagic square of order \eqn{n} where \eqn{n=6m\pm 1}{n=6n+/-1}}
}

\details{
  Function \code{panmagic.6npm1(n)} will return a square if \code{n} is
  not of the form \eqn{6m\pm 1}{6n+/-1}, but it is not necessarily
  magic.
}

\references{

\dQuote{Pandiagonal magic square.} \emph{Wikipedia, The Free
Encyclopedia.} Wikimedia Foundation, Inc. 13 February 2013 }


\author{Robin K. S. Hankin}
\seealso{\code{\link{magic}}}
\examples{
panmagic.6np1(1)
panmagic.6npm1(13)

all(sapply(panmagic.6np1(1:3),is.panmagic))

}
\keyword{array}
