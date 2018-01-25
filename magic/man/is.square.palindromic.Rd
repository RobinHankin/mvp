\name{is.square.palindromic}
\alias{is.square.palindromic}
\alias{is.centrosymmetric}
\alias{is.persymmetric}
\title{Is a square matrix square palindromic?}
\description{
  Implementation of various properties presented in a paper by Arthur
  T. Benjamin and K. Yasuda
}
\usage{
is.square.palindromic(m, base=10, give.answers=FALSE)
is.centrosymmetric(m)
is.persymmetric(m)
}
\arguments{
  \item{m}{The square to be tested}
  \item{base}{Base of number expansion, defaulting to 10; not relevant
    for the \dQuote{sufficient} part of the test}
  \item{give.answers}{Boolean, with \code{TRUE} meaning to return
    additional information}
}
\details{
The following tests apply to a general square matrix \code{m} of size
\eqn{n\times n}{n*n}.

\itemize{
  
  \item A \dfn{centrosymmetric} square is one in which
\code{a[i,j]=a[n+1-i,n+1-j]}; use \code{is.centrosymmetric()} to test
for this (compare an \emph{associative} square).  Note that this
definition extends naturally to hypercubes: a hypercube \code{a} is
centrosymmetric if \code{all(a==arev(a))}.

\item A \dfn{persymmetric square} is one in which
\code{a[i,j]=a[n+1-j,n+1-i]}; use \code{is.persymmetric()} to test for
this.

\item A matrix is \dfn{square palindromic} if it satisfies the rather
complicated conditions set out by Benjamin and Yasuda (see refs).
}

}
\value{
  These functions return a list of Boolean variables whose value depends
  on whether or not \code{m} has the property in question.

  If argument \code{give.answers} takes the default value of
  \code{FALSE}, a Boolean value is returned that shows whether the
  sufficient conditions are met.

  If argument \code{give.answers} is \code{TRUE}, a detailed list is
  given that shows the status of each individual test, both for the
  necessary and sufficient conditions.  The value of the second element
  (named \code{necessary}) is the status of their Theorem 1 on page 154.

  Note that the necessary conditions do not depend on the base \code{b}
  (technically, neither do the sufficient conditions, for being a square
  palindrome requires the sums to match for \emph{every} base \code{b}.
  In this implementation, \dQuote{sufficient} is defined only with
  respect to a particular base).
}
\references{Arthur T. Benjamin and K. Yasuda.  \emph{Magic
    \dQuote{Squares} Indeed!}, American Mathematical Monthly, vol
  106(2), pp152-156, Feb 1999}
\author{Robin K. S. Hankin}
\note{
  Every associative square is square palindromic, according to Benjamin
  and Yasuda.

  Function \code{is.square.palindromic()} does not yet take a
  \code{give.answers} argument as does, say, \code{is.magic()}.
}
\examples{
is.square.palindromic(magic(3))
is.persymmetric(matrix(c(1,0,0,1),2,2))

#now try a circulant:
a <- matrix(0,5,5)
is.square.palindromic(circulant(10))  #should be TRUE
}
\keyword{array}

