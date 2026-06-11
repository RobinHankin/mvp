\name{ooom}
\alias{ooom}
\title{One over one minus a multivariate polynomial}
\description{

Uses Taylor's theorem to give one over one minus a multipol:

\deqn{\frac{1}{1-x} = 1+x+x^2+\ldots}{omitted}

Function \code{ooom()} requires an argument \code{n} and returns

\deqn{\frac{1}{1-x} = 1+x+x^2+\ldots+x^n}{omitted}

}
\usage{
ooom(P, n)
}
\arguments{
  \item{n}{Order of expansion}
  \item{P}{Multivariate polynomial}
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{horner}}}
\examples{
ooom("x", 5)
ooom("x", 5) * as.mvp("1-x")  # 1 + O(x^6)


ooom("x+y", 4)

"x+y" |> ooom(5) |> aderiv(x=2, y=1)

}
