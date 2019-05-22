\name{mvp-package}
\alias{mvp-package}
\docType{package}
\title{
\packageTitle{mvp}
}
\description{
\packageDescription{mvp}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{mvp}
\packageIndices{mvp}

}
\author{
\packageAuthor{mvp}

Maintainer: \packageMaintainer{mvp}
}
\keyword{ package }
\examples{
p <- as.mvp("1+x+x*y+x^5")

p + as.mvp("a+b^6")

p^3

subs(p^4,x="a+b^2")
aderiv(p^2,x=4)
horner(p,1:3)
}
