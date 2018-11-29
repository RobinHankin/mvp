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
Access the different parts of an mvp object.  
}
\author{Robin K. S. Hankin}
\examples{
a <- rmvp(5)
vars(a)
powers(a)
coefficients(a)
}