\name{sam}
\alias{sam}
\title{Sparse antimagic squares}
\description{
  Produces an antimagic square of order \eqn{m} using
  Gray and MacDougall's method.
}
\usage{
sam(m, u, A=NULL, B=A)
}
\arguments{
  \item{m}{Order of the magic square (not \dQuote{\code{n}}: the
    terminology follows Gray and MacDougall)}
  \item{u}{See details section}
  \item{A,B}{Start latin squares, with default \code{NULL} meaning to
    use \code{circulant(m)}}
}
\details{
  In Gray's terminology, \code{sam(m,n)} produces a
  \eqn{SAM(2m,2u+1,0)}.

  The method is not vectorized.

  To test for these properties, use functions such as
  \code{is.antimagic()}, documented under \code{is.magic.Rd}.
}
\references{
  I. D. Gray and J. A. MacDougall 2006.  \dQuote{Sparse anti-magic squares
    and vertex-magic labelings of bipartite graphs}, \emph{Discrete
  Mathematics}, volume 306, pp2878-2892
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{magic}},\code{\link{is.magic}}}
\examples{
sam(6,2)

jj <- matrix(c(
     5, 2, 3, 4, 1,
     3, 5, 4, 1, 2,
     2, 3, 1, 5, 4,
     4, 1, 2, 3, 5, 
     1, 4, 5, 2, 3),5,5)

is.sam(sam(5,2,B=jj))

}
\keyword{array}
