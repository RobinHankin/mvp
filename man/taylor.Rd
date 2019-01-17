\name{taylor}
\alias{taylor}
\title{Taylor series}
\description{Truncated Taylor series of multivariate polynomials}
\usage{
taylor(S,n,v)
}
\arguments{
  \item{S}{mvp object}
  \item{n}{Non-negative integer specifying highest order to be retained}
  \item{v}{Variable to take Taylor series with respect to.  If missing,
    total power of each term is used}
}
\author{Robin K. S. Hankin}

\details{Does what it says on the tin, basically.}
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
