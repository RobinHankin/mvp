\name{subs}
\alias{subs}
\alias{substitute}
\alias{subsmvp}
\alias{subs_mvp}
\alias{mvp_subs_mvp}
\title{Substitution}
\description{Substitute symbols in an mvp object for numbers or other
  multivariate polynomials
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
\details{
Function \code{subs()} uses a natural R idiom to substitute scalar
values for symbols.  Observe that this type of substitution is
insensitive to order: \code{subs(P,a=1,b=3) == subs(P,b=3,a=1)}.  This
would appear in mathematica as \code{P /. \{a -> 1, b->3\}} which
is a much preferable idiom, IMO.

Function \code{subsmpv()} takes a mvp object and substitutes another mvp
object for a specific symbol.  This operation is sensitive to order
which is why a different R idiom is needed.
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
