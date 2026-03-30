\name{mmvp}
\alias{mmvp}
\title{Spray-style specification of mvp objects}
\description{
  Create an \code{mvp} object using an index matrix and a vector of
  coefficients, \CRANpkg{spray}-style.
}  
\usage{mmvp(M, coeffs, vars)}
\arguments{
  \item{M}{Integer matrix with rows corresponding to terms of a
multivariate polynomial}
  \item{coeffs}{Numeric vector of coefficients; if missing, default to a
vector of 1s}
  \item{vars}{Character vector of variable names}
}
\details{

Function \code{mmvp()} uses syntax similar to \code{spray::spray()} but
adapted for the \pkg{mvp} package.

If argument \code{vars} is missing, variables are named after the
colnames of \code{M}.

}
\value{
Returns a multivariate polynomial, an object of class \code{mvp}}
\author{Robin K. S. Hankin}
\examples{

mmvp(matrix(1:35, 5, 7))

mmvp(matrix(rpois(21,1), ncol=3), 1:7)

}
