\name{accessor}
\alias{accessors}
\alias{vars}
\alias{powers}
\alias{coefficients}
\alias{constant}
\alias{constant<-}
\alias{constant.mvp}
\alias{constant<-.mvp}
\title{Accessor methods for mvp objects}
\description{Accessor methods for mvp objects}
\usage{
vars(x)
powers(x)
coefficients(x)
\method{constant}{mvp}(x)
\method{constant}{mvp}(x) <- value
}
\arguments{
  \item{x}{Object of class mvp}
  \item{value}{Scalar value for the constant}
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

constant(a)
constant(a) <- 33
}