\name{rmvp}
\alias{rmvp}
\title{Random multivariate polynomials}
\description{Random multivariate polynomials, intended as quick
  \dQuote{get you going} examples of \code{mvp} objects}
\usage{
rmvp(n=7, size = 6, pow = 6, symbols = 6)
}
\arguments{
  \item{n}{Number of terms to generate}
  \item{size}{Maximum number of symbols in each term}
  \item{pow}{Maximum power of each symbol}
  \item{symbols}{Symbols to use; if numeric, interpret as the first
    \code{symbols} letters of the alphabet}
}
\details{
What you see is what you get, basically.  Note that a term such as
\code{a^2*b*a^3} will be simplified to \code{a^5*b}, so powers in the
result may be larger than argument \code{pow}. 
}
\value{
Returns a multivariate polynomial, an object of class \code{mvp}}
\author{Robin K. S. Hankin}
\examples{
rmvp()
rmvp(5,symbols=state.abb)
}
