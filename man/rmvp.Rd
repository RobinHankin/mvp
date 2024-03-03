\name{rmvp}
\alias{rmvp}
\alias{rhmvp}
\alias{rmvpp}
\alias{rmvppp}
\title{Random multivariate polynomials}
\description{Random multivariate polynomials, intended as quick
  \dQuote{get you going} examples of \code{mvp} objects}
\usage{
rhmvp(n=7,size=4,pow=6,symbols=6)
rmvp(n=7,size=4,pow=6,symbols=6)
rmvpp(n=30,size=9,pow=20,symbols=15)
rmvppp(n=100,size=15,pow=99,symbols)
}
\arguments{
  \item{n}{Number of terms to generate}
  \item{size}{Maximum number of symbols in each term}
  \item{pow}{Maximum power of each symbol}
  \item{symbols}{Symbols to use; if numeric, interpret as the first
    \code{symbols} letters of the alphabet}
}
\details{

Function \code{rhmvp()} returns a random homogeneous \code{mvp}.
Function \code{rmvp()} returns a possibly nonhomogenous \code{mvp} and
functions \code{rmvpp()} and \code{rmvppp()} return, by default,
progressively more complicated \code{mvp} objects.  Function
\code{rmvppp()} returns a polynomial with multi-letter variable names.

}
\value{
Returns a multivariate polynomial, an object of class \code{mvp}}
\author{Robin K. S. Hankin}
\examples{
rhmvp()
rmvp()
rmvpp()
rmvppp()
}
