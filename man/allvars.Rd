\name{allvars}
\alias{allvars}
\title{All variables in a multivariate polynomial}
\description{
Returns a character vector containing all the variables present in a
\code{mvp} object.
}
\usage{allvars(x)}
\arguments{\item{x}{object of class \code{mvp}}}
\author{Robin K. S. Hankin}
\note{The character vector returned is not in any particular order}
\examples{
p <- rmvp(5)
p
allvars(p)
}
\keyword{symbolmath}

