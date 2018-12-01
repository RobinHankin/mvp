\name{accessor}
\alias{accessors}
\alias{vars}
\alias{powers}
\alias{coeffs}
\alias{coefficients}
\title{Accessor methods for mvp objects}
\description{Accessor methods for mvp objects}
\usage{
vars(x)
powers(x)
coeffs(x)
}
\arguments{
  \item{x}{Object of class mvp}
}
\details{
Access the different parts of an mvp object.    The constant term is
technically a coefficient but is documented under \code{constant.Rd}. 
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{constant}}}
\examples{
a <- rmvp(5)
vars(a)
powers(a)
coefficients(a)
}