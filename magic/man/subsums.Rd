\name{subsums}
\alias{subsums}
\title{Sums of submatrices}  
\description{
Returns the sums of submatrices of an array; multidimensional moving
window averaging}
  \usage{
subsums(a,p,func="sum",wrap=TRUE, pad=0)
}
\arguments{
  \item{a}{Array to be analysed}
  \item{p}{Argument specifying the subarrays to be summed.  If a vector
  of length greater than one,
  it is assumed to be of length \code{d=length(dim(a))}, and is
  interpreted to be the dimensions of the subarrays, with
  the size of the window's \eqn{n{^{\rm th}}}{n-th} dimension being
  \code{a[n]}.  If the length of \code{p} is one, recycling is used.

  If not a vector, is assumed to be a matrix with \code{d} columns, each
  row representing the coordinates of the elements to be summed.  See
  examples.  

  }
  \item{func}{Function to be applied over the elements of the moving
    window.  Default value of \code{sum} gives the sum as used in
    \code{is.2x2.correct()};  other choices might be \code{mean},
    \code{prod}, or \code{max}.  

    If \code{sum=""}, return the array of dimension
    \code{c(dim(a),prod(p))} where each hyperplane is a shifted version
    of \code{a}.}
  \item{wrap}{Boolean, with default value of \code{TRUE} meaning to view
    array \code{a} as a n-dimensional torus.  Thus, if
    \code{x=subsums(a,p,wrap=TRUE)}, and if \code{dim(a)=c(a_1,...,a_d)}
    then \code{x[a_1,...,a_d]} is the sum of all corner elements of
    \code{a}.

    If \code{FALSE}, do not wrap \code{a} and return an array of
    dimension \code{dim(a)+p-1}.}
  \item{pad}{If \code{wrap} is \code{TRUE}, \code{pad} is
    the value used   to pad the array with.  Use a \dQuote{neutral} value here;
    for example, if \code{func=sum}, then use 0; if \code{max}, use
    \eqn{-\infty}{-Inf}.}
}
\details{
  The offset is specified so that \code{allsums(a,v)[1,1,...,1]=
    sum(a[1:v[1],1:v[2],...,1:v[n]])}, where \code{n=length(dim(a))}.

  Function \code{subsums()} is used in \code{is.2x2.correct()} and
  \code{is.diagonally.correct()}. 
}  
\author{Robin K. S. Hankin}
\examples{
  data(Ollerenshaw)
  subsums(Ollerenshaw,c(2,2))
  subsums(Ollerenshaw[,1:10],c(2,2))
  subsums(Ollerenshaw, matrix(c(0,6),2,2)) # effectively, is.bree.correct()

  # multidimensional example.  
  a <- array(1,c(3,4,2))
  subsums(a,2)             # note that p=2 is equivalent to p=c(2,2,2);
                           # all elements should be identical

  subsums(a,2,wrap=FALSE)  #note "middle" elements > "outer" elements


  #Example of nondefault function:
  x <- matrix(1:42,6,7)
  subsums(x,2,func="max",pad=Inf,wrap=TRUE)  
  subsums(x,2,func="max",pad=Inf,wrap=FALSE)
}
\keyword{array}
