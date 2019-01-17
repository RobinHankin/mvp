\name{taylor}
\alias{taylor}
\alias{mvp_taylor_allvars}
\alias{mvp_taylor_onevar}
\title{Taylor series}
\description{Truncated Taylor series of multivariate polynomials}
\usage{
taylor(S,n,v)
mvp_taylor_onevar(allnames,allpowers,coefficients, n, v)
mvp_taylor_allvars(allnames,allpowers,coefficients, n)
}
\arguments{
  \item{S}{mvp object}
  \item{n}{Non-negative integer specifying highest order to be retained}
  \item{v}{Variable to take Taylor series with respect to.  If missing,
    total power of each term is used}
  \item{allnames,allpowers,coefficients}{Components of mvp objects}
}
\details{
  Function \code{taylor()} does what it says on the tin, basically.
  Functions \code{mvp_taylor_onevar()} and \code{mvp_taylor_allvars()}
  are low-level helper functions that are not intended for the user.
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{deriv}}}
\examples{
taylor(as.mvp("1+x")^6,2)

taylor(as.mvp("1+x+y")^3,2)      # neglects all terms with total power>2
taylor(as.mvp("1+x+y")^3,2,"x")  # terms like y^3 are treated as constants

# Works well with pipes:

p <- horner("x+y",1:4)
p \%>\% taylor(2)
p \%>\% taylor(2,"x")
(p \%>\% subs(x="x+dx") -p) \%>\% taylor(2,"dx")


}
\keyword{symbolmath}
