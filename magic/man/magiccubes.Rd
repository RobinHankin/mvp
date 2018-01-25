\name{magiccubes}
\alias{magiccubes}
\docType{data}
\title{Magic cubes of order 3}
\description{
A list of four elements listing each fundamentally different magic cube
of order 3
}
\usage{data(magiccubes)}
\source{
Originally discovered by Hendricks
}
\examples{
data(magiccubes)
magiccubes$a1
sapply(magiccubes,is.magichypercube)
}
\keyword{datasets}
