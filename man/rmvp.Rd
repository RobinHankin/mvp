\name{rmvp}
\alias{rmvp}
\title{Random multivariate polynomials}
\description{Random multivariate polynomials, intended as quick
  \dQuote{get you going} examples of mvp objects}
\usage{
rmvp(n, size = 6, pow = 6, symbols = letters)
}
\arguments{
  \item{n}{Number of terms to generate}
  \item{size}{Maximum number of symbols in each term}
  \item{pow}{Maximum power of each symbol}
  \item{symbols}{Symbols to use}
}
\details{
What you see is what you get, basically
}
\value{
Returns a multivariate polynomial, an object of class \code{mvp}}
\author{Robin K. S. Hankin}
\examples{
rmvp(5)
}