\name{apad}
\alias{apad}
\title{Pad arrays}
\description{
Generalized padding for arrays of arbitrary dimension
}
\usage{
apad(a, l, e = NULL, method = "ext", post = TRUE)
}
\arguments{
  \item{a}{Array to be padded}
  \item{l}{Amount of padding to add.  If a vector of length greater than
    one, it is interpreted as
    the extra extent of \code{a} along each of its dimensions (standard
    recycling is used).  If of length one, interpret as the dimension to be
    padded, in which case the amount is given by argument \code{l}.}
  \item{e}{If \code{l} is of length one, the  amount of padding to add to
    dimension \code{l}}
  \item{method}{String specifying the values of the padded elements.  See
    details section.}
  \item{post}{Boolean, with default \code{TRUE} meaning to append to
      \code{a} and \code{FALSE} meaning to prepend.}
}  
\details{
    Argument \code{method} specifies the values of the padded elements.
    It can be either \dQuote{\code{ext}},
    \dQuote{\code{mirror}}, or \dQuote{\code{rep}}.
    
    Specifying \code{ext} (the default) uses a padding value given by
    the \dQuote{nearest} element of \code{a}, as measured by the
    Manhattan metric.

    Specifying \code{mirror} fills the array with alternate mirror
    images of \code{a}; while \code{rep}  fills it with unreflected copies
    of \code{a}.
}
\author{Robin K. S. Hankin}
\note{
  Function \code{apad()} does not work with arrays with dimensions of
  zero extent: what to pad it with?  To pad with a particular value, use
  \code{adiag()}.

  The function works as expected with vectors, which are treated as
  one-dimensional arrays.  See examples section.

  Function \code{apad()} is distinct from \code{adiag()}, which takes
  two arrays and binds them together.  Both functions create an array of
  the same dimensionality as their array arguments but with possibly
  larger extents.  However, the functions differ in the values of the
  new array elements. Function \code{adiag()} uses a second array;
  function \code{apad()} takes the values from its primary array argument. 
}
\seealso{\code{\link{adiag}}}
\examples{

apad(1:10,4,method="mirror")


a <- matrix(1:30,5,6)

apad(a,c(4,4))
apad(a,c(4,4),post=FALSE)

apad(a,1,5)

apad(a,c(5,6),method="mirror")
apad(a,c(5,6),method="mirror",post=FALSE)
}
\keyword{array}
