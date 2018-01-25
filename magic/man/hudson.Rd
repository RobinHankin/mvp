\name{hudson}
\alias{hudson}
\title{Pandiagonal magic squares due to Hudson}
\description{
Returns a regular pandiagonal magic square of order
\eqn{6m\pm 1}{6m+/-1} using a method developed by Hudson.
}
\usage{
hudson(n = NULL, a = NULL, b = NULL)
}
\arguments{
  \item{n}{Order of the square, \eqn{n=6m\pm 1}{n=6m+/-1}.  If
    \code{NULL}, use the length of \code{a}}
  \item{a}{The first line of Hudson's \eqn{A} matrix.  If
    \code{NULL}, use Hudson's value of \code{c(n-1,0:(n-2))}}
  \item{b}{The first line of Hudson's \eqn{B} matrix.  If
    \code{NULL}, use Hudson's value of \code{c(2:(n-1),n,1)}.
    Using default values for \code{a} and \code{b} gives an associative square
  }
}
\details{
  Returns one member of a set of regular magic squares of order
  \eqn{n=6m\pm 1}{n=6m+/-1}.  The set is of size \eqn{(n!)^2}.

  Note that \code{n} is not checked for being in the form \eqn{6n\pm
    1}{6n+1/6n-1}.  If it is not the correct form, the square is magic
    but not necessarily normal.
   
}
\references{C. B. Hudson, \emph{On pandiagonal squares of order 6t +/- 1},
  Mathematics magazine, March 1972, pp94-96}
\author{Robin K. S. Hankin}
\seealso{\code{\link{recurse}}}
\examples{
hudson(n=11)
magicplot(hudson(n=11))
is.associative(hudson(n=13))
hudson(a=(2*1:13)\%\%13 ,  b=(8*1:13)\%\%13)
all(replicate(10,is.magic(hudson(a=sample(13),b=sample(13)))))
}
\keyword{array}
