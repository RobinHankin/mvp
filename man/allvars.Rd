\name{allvars}
\alias{allvars}
\title{All variables in a multivariate polynomial}
\description{
Returns a character vector containing all the variables present in a
\code{mvp} object.

\preformatted{
> (p <- rmvp(3))
mvp object algebraically equal to
3 a^5 c^4 d^2 f^5  +  2 b^4 c^3 d^7 e^5 f^5  +  b^9 c^8 f^5
> allvars(p)
[1] "a" "b" "c" "d" "e" "f"
> 
}

}
\usage{
allvars(x)
}
\arguments{
  \item{x}{object of class \code{mvp}}
}
\author{Robin K. S. Hankin}
\note{The character vector returned is not in any particular order}
\examples{
p <- rmvp(5)
allvars(p)
}
\keyword{symbolmath}

