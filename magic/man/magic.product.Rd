\name{magic.product}
\alias{magic.product}
\alias{magic.product}
\alias{magic.product.fast}
\title{Product of two magic squares}
\description{
  Gives a magic square that is a product of two magic squares.
}
\usage{
magic.product(a, b, mat=NULL)
magic.product.fast(a, b)
}
\arguments{
  \item{a}{First magic square; if \code{a} is an integer, use \code{magic(a)}.}
  \item{b}{as above}
  \item{mat}{Matrix, of same size as \code{a}, of integers treated as
    modulo 8.  Default value of \code{NULL} equivalent to passing
    \code{a*0}.  Each number from 0-7 corresponds to one of the 8
    squares which have the same Frenicle's standard form, as generated
    by \code{transf()}.  Then
    subsquares of the product square (ie tiles of the same size as
    \code{b}) are rotated and transposed appropriately according to
    their corresponding entry in \code{mat}.  This is a lot easier to
    see than to describe (see examples section).}
}
\details{
  Function \code{magic.product.fast()} does not take a \code{mat}
  argument, and is equivalent to \code{magic.product()} with \code{mat}
  taking the default value of \code{NULL}.  The improvement in speed is
  doubtful unless \code{order(a)}\eqn{\gg}{>>}\code{order(b)}, in which
  case there appears to be a substantial saving.
}
\references{
  William H. Benson and Oswald Jacoby. New recreations with magic
  squares, Dover 1976 (and that paper in JRM)}
\author{Robin K. S. Hankin}
\examples{
magic.product(magic(3),magic(4))
magic.product(3,4)

mat <- matrix(0,3,3)
a <- magic.product(3,4,mat=mat)
mat[1,1] <- 1
b <- magic.product(3,4,mat=mat)

a==b
}
\keyword{array}
