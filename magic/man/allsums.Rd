\name{allsums}
\alias{allsums}
\title{Row, column, and two diagonal sums of arrays}
\description{
  Returns all rowsums, all columnsums, and all (broken) diagonal sums of
  a putative magic square.
}
\usage{
allsums(m,func=NULL, ...)
}
\arguments{
  \item{m}{The square to be tested}
  \item{func}{Function, with default \code{NULL} interpreted
    as\code{sum()}, to be applied to the square rowwise, columnwise, and
    diagonalwise}
  \item{...}{Further arguments passed to \code{func()}}
}
\value{
  Returns a list of four elements.  In the following, \dQuote{sums}
  means \dQuote{the result of applying func()}.
  \item{rowsums}{All \eqn{n} row sums}
  \item{colsums}{All \eqn{n} column sums}
  \item{majors}{All \eqn{n} broken major diagonals (northwest-southeast).
    First element is the long (unbroken) major diagonal, tested by
    \code{is.magic()}}
  \item{minors}{All \eqn{n} broken minor diagonals (northeast-southwest).
    First element is the long (unbroken) minor diagonal.}
}
\author{Robin K. S. Hankin}
\note{
  If \code{func()} returns a vector, then the \code{allsums()} returns a
  list whose columns are the result of applying \code{func()}.  See third
  and fourth examples below.

  Used by \code{is.magic()} et seq.

  The major and minor diagonals would benefit from being recoded in C.
}
\seealso{\code{\link{is.magic}},\code{\link{is.semimagic}},\code{\link{is.panmagic}}}
\examples{
allsums(magic(7))
allsums(magic(7),func=max)

allsums(magic(7),func=range)
allsums(magic(7),func=function(x){x[1:2]})


allsums(magic(7),sort)
  # beware! compare apply(magic(7),1,sort) and apply(magic(7),2,sort)

}
\keyword{array}
