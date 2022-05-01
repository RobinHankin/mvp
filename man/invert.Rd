\name{invert}
\alias{invert}
\title{Replace symbols with their reciprocals}
\description{
Given an \code{mvp} object, replace one or more symbols with their reciprocals
}
\usage{
invert(p, v)
}
\arguments{
  \item{p}{Object (coerced to) \code{mvp} form}
  \item{v}{Character vector of symbols to be replaced with their
    reciprocal; missing interpreted as replace all symbols}
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{subs}}}
\examples{
invert("x")

(P <- as.mvp("1+a+6*a^2 -7*a*b"))
invert(P,"a")

}
