\name{spray}
\alias{spray}
\alias{freealg_to_mvp}
\alias{spray_to_mvp}
\alias{mvp_to_spray}
\title{Spray functionality}
\description{Convert between \code{spray} objects and \code{mvp}
  objects, also coerce from \code{freealg} objects}
\usage{
spray_to_mvp(L, symbols = letters)
mvp_to_spray(S)
freealg_to_mvp(x)
}

\arguments{
  \item{L}{Object of class \code{mvp}}
  \item{symbols}{character vector of symbols}
  \item{S}{Spray object}
  \item{x}{Free algebra object, class \code{freealg}}
}
\author{Robin K. S. Hankin}
\examples{

mvp_to_spray(rmvp(5))
spray_to_mvp(spray::spray(diag(6),1:6))
}

\keyword{symbolmath}