\name{print}
\alias{print.mvp}
\alias{print_mvp}
\title{
Print methods for \code{mvp} objects
}
\description{
Print methods for \code{mvp} objects: to print, an \code{mvp} object is coerced to
\code{mpoly} form and the \code{mpoly} print method used.

}
\usage{
\method{print}{mvp}(x, ...)
}
\arguments{
  \item{x}{Object of class \code{mvp}, coerced to \code{mpoly} form}
  \item{...}{Further arguments}
}
\details{
  See \code{mvp.Rd} for notes on interactive inspection in Rstudio.
}  
\value{Returns its argument invisibly}
\author{Robin K. S. Hankin}
\seealso{\code{\link{mvp}}}
\examples{

a <- rmvp(4)
a
print(a)
print(a,stars=TRUE)
print(a,varorder=rev(letters))
}
\keyword{symbolmath}
