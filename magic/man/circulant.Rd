\name{circulant}
\alias{circulant}
\alias{is.circulant}
\title{Circulant matrices of any order}
\description{
Creates and tests for circulant matrices of any order
}
\usage{
circulant(vec)
is.circulant(m,dir=rep(1,length(dim(m))))
}
\arguments{
  \item{vec}{In \code{circulant()}, vector of elements of the first
    row.  If of length one, interpret as the order of the matrix
   and use \code{1:vec}.}
  \item{m}{In \code{is.circulant()}, matrix to be tested for
    circulantism}
  \item{dir}{In \code{is.circulant()}, the direction of the diagonal.
    In a matrix, the default value (\code{c(1,1)}) traces the major
    diagonals}
}
\details{

  A matrix \eqn{a} is \dfn{circulant} if all major diagonals, including
  broken diagonals, are uniform; ie if
  \eqn{a_{ij}=a_{kl}}{a[i,j]==a[k,j]} when \eqn{i-j=k-l} (modulo
  \eqn{n}).  The standard values to use give \code{1:n} for the top row.

  In function \code{is.circulant()}, for arbitrary dimensional arrays,
  the default value for \code{dir} checks that
  \code{a[v]==a[v+rep(1,d)]==...==a[v+rep((n-1),d)]} for all \code{v}
  (that is, following lines parallel to the major diagonal); indices are
  passed through \code{process()}.

  For general \code{dir}, function \code{is.circulant()} checks that
  \code{a[v]==a[v+dir]==a[v+2*dir]==...==a[v+(n-1)*d]} for all
  \code{v}.

  A \dfn{Toeplitz} matrix is one in which \code{a[i,j]=a[i',j']}
  whenever \code{|i-j|=|i'-j'|}.  See function \code{toeplitz()} of the
  \code{stats} package for details.
}
\references{Arthur T. Benjamin and K. Yasuda.  \emph{Magic
    \dQuote{Squares} Indeed!}, American Mathematical Monthly, vol
  106(2), pp152-156, Feb 1999}
\author{Robin K. S. Hankin}
\examples{
circulant(5)
circulant(2^(0:4))
is.circulant(circulant(5))

 a <- outer(1:3,1:3,"+")\%\%3
 is.circulant(a)
 is.circulant(a,c(1,2))

 is.circulant(array(c(1:4,4:1),rep(2,3)))

 is.circulant(magic(5)\%\%5,c(1,-2))

}
\keyword{array}
