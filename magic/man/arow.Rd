\name{arow}
\alias{arow}
\title{Generalized row and col}
\description{
Given an array, returns an array of the same size whose elements
are sequentially numbered along the \eqn{i^{\rm th}}{i-th} dimension.
}
\usage{
arow(a, i)
}
\arguments{
  \item{a}{array to be converted}
  \item{i}{Number of the dimension}
}
\value{
An integer matrix with the same dimensions as \code{a}, with element 
\eqn{\left(n_1,n_2,\ldots n_d\right)}{(n1,n2, ..., n_d)}
being \eqn{n_i}{n_i}.
}
\author{Robin K. S. Hankin}
\note{
This function is equivalent to, but faster than,
\code{function(a,i){do.index(a,function(x){x[i]})}}.  However, it is
much more complicated.
}     
\examples{
a <- array(0,c(3,3,2,2))
arow(a,2)
(arow(a,1)+arow(a,2)+arow(a,3)+arow(a,4))\%\%2

}
\keyword{array}
