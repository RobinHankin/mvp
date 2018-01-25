\name{process}
\alias{process}
\title{Force index arrays into range}
\description{
Forces an (integer) array to have entries in the range 1-n, by (i)
taking the entries modulo n, then (ii) setting zero elements to n.
Useful for modifying index arrays into a form suitable for use with
magic squares.}
\usage{
process(x, n)
}
\arguments{
  \item{x}{Index array to be processed}
  \item{n}{Modulo of arithmetic to be used}
}
\author{Robin K. S. Hankin}
\examples{
# extract the broken diagonal of magic.2np1(4) that passes
# through element [1,5]:

a <- magic.2np1(4)
index <- t(c(1,5)+rbind(1:9,1:9))
a[process(index,9)]
}
\keyword{array}
