\name{magicplot}
\alias{magicplot}
\title{Joins consecutive numbers of a magic square.}
\description{
A nice way to graphically represent normal magic squares.  Lines are
plotted to join successive numbers from 1 to \eqn{n^2}{n^2}.
Many magic squares have attractive such plots.
}
\usage{
magicplot(m, number = TRUE, do.circuit = FALSE, ...)
}
\arguments{
  \item{m}{Magic square to be plotted.}
  \item{number}{Boolean variable with \code{TRUE} meaning to include the
    numbers on the plot}
  \item{do.circuit}{Boolean variable with \code{TRUE} meaning to include the
    line joining \eqn{n^2}{n^2} to 1}
  \item{\dots}{Extra parameters passed to \code{plot()}}
}
\author{Robin K. S. Hankin}
\examples{
magicplot(magic.4n(2))
}
\keyword{array}

