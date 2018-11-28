\name{subs}
\alias{subs}
\alias{substitute}
\alias{subsmvp}
\alias{subs_mvp}
\alias{mvp_subs_mvp}
\alias{mvp_substitute_mvp}
\title{Substitution}
\description{
}
\usage{
subs(S, ..., drop = TRUE)
subsmvp(S,v,X)
}
\arguments{
  \item{S,X}{Multivariate polynomials}
  \item{\dots}{named arguments corresponding to variables to substitute}
  \item{drop}{Boolean with default \code{TRUE} meaning to return a
    scalar (the constant) in place of a constant mvp object}
  \item{v}{A string corresponding to the variable to substitute}
}
\value{
  Return a multivariate polynomial, object of class mvp
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{drop}}}
\examples{
p <- rmvp(6,2,2,letters[1:3])
p
subs(p,a=1)
subs(p,a=1,b=2)
subs(p,a=1,b=2,c=3)
subs(p,a=1,b=2,c=3,drop=FALSE)

subsmvp(p,'a',as.mvp("1+x+x^4"))
}
\keyword{symbolmath}
