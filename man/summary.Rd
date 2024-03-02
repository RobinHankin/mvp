\name{summary}
\alias{summary}
\alias{nterms}
\alias{summary.mvp}
\alias{print.summary.mvp}
\alias{rtypical}
\title{Summary methods for mvp objects}
\description{
Summary methods for mvp objects and extraction of typical terms
}
\usage{
\method{summary}{mvp}(object, ...)
\method{print}{summary.mvp}(x, ...)
rtypical(object,n=3)
}
\arguments{
  \item{x,object}{Multivariate polynomial, class \code{mvp}}
  \item{n}{In \code{rtypical()}, number of terms (in addition to the
    constant) to select}
  \item{...}{Further arguments, currently ignored}
}
\details{

The summary method prints out a list of interesting facts about an
\code{mvp} object such as the longest term or highest power.  Function
\code{rtypical()} extracts the constant if present, and a \emph{random}
selection of terms of its argument.
}
\author{Robin K. S. Hankin}
\examples{
summary(rmvp(40))
rtypical(rmvp(40))
}
\keyword{math}
