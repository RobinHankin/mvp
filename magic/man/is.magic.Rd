\name{is.magic}
\alias{is.magic}
\alias{is.panmagic}
\alias{is.pandiagonal}
\alias{is.semimagic}
\alias{is.semimagic.default}
\alias{is.associative}
\alias{is.regular}
\alias{is.ultramagic}
\alias{is.normal}
\alias{is.sparse}
\alias{is.mostperfect}
\alias{is.2x2.correct}
\alias{is.bree.correct}
\alias{is.latin}
\alias{is.antimagic}
\alias{is.totally.antimagic}
\alias{is.heterosquare}
\alias{is.totally.heterosquare}
\alias{is.sam}
\alias{is.stam}
\title{Various tests for the magicness of a square}
\description{
  Returns \code{TRUE} if the square is magic, semimagic, panmagic, associative,
  normal.  If argument \code{give.answers} is \code{TRUE}, also returns
  additional information about the sums.
}
\usage{
is.magic(m, give.answers = FALSE, func=sum, boolean=FALSE) 
is.panmagic(m, give.answers = FALSE, func=sum, boolean=FALSE) 
is.pandiagonal(m, give.answers = FALSE, func=sum, boolean=FALSE) 
is.semimagic(m, give.answers = FALSE, func=sum, boolean=FALSE) 
is.semimagic.default(m)
is.associative(m)
is.normal(m)
is.sparse(m)
is.mostperfect(m,give.answers=FALSE)
is.2x2.correct(m,give.answers=FALSE)
is.bree.correct(m,give.answers=FALSE)
is.latin(m,give.answers=FALSE)
is.antimagic(m, give.answers = FALSE, func=sum) 
is.totally.antimagic(m, give.answers = FALSE, func=sum)
is.heterosquare(m, func=sum) 
is.totally.heterosquare(m, func=sum)
is.sam(m)
is.stam(m)
}
\arguments{
  \item{m}{The square to be tested}
  \item{give.answers}{Boolean, with \code{TRUE} meaning return additional
    information about the sums (see details)}
  \item{func}{A function that is evaluated for each row, column, and
    unbroken diagonal}
  \item{boolean}{Boolean, with \code{TRUE} meaning that the square is
    deemed magic, semimagic, etc, if all applications of \code{func}
    evaluate to \code{TRUE}.  If \code{boolean} is \code{FALSE}, square
    \code{m} is magic etc if all applications of \code{func} are
    identical}
}
\details{
  \itemize{
    \item A \dfn{semimagic square} is one all of whose row sums equal
    all its columnwise sums (ie the magic constant).
    \item A \dfn{magic square} is a semimagic square with the sum of
    both unbroken diagonals equal to the magic constant.

    \item A \dfn{panmagic square} is a magic square all of whose broken
    diagonals sum to the magic constant.  Ollerenshaw calls this a
    \dQuote{pandiagonal} square.

    \item A \dfn{most-perfect} square has all 2-by-2 arrays anywhere
    within the square summing to \eqn{2S} where \eqn{S=n^2+1}; and all
    pairs of integers \eqn{n/2} distant along the same major (NW-SE)
    diagonal sum to \eqn{S} (note that the \eqn{S} used here differs
    from Ollerenshaw's because her squares are numbered starting at
    zero).  The first condition is tested by \code{is.2x2.correct()} and
    the second by \code{is.bree.correct()}.
  
    All most-perfect squares are panmagic.

    \item A \dfn{normal square} is one that contains \eqn{n^2}
    consecutive integers (typically starting at 0 or 1).

    \item A \dfn{sparse} matrix is one whose nonzero entries are
    consecutive integers, starting at 1.
    
    \item An \dfn{associative square} (also \dfn{regular square}) is a magic square in which
    \eqn{a_{i,j}+a_{n+1-i,n+1-j}=n^2+1}{a[i,j]+a[n+1-i,n+1-j]=n^2+1}.
    Note that an associative semimagic square is magic; see also
    \code{is.square.palindromic()}.  The definition extends to magic
    hypercubes: a hypercube \code{a} is associative if \code{a+arev(a)}
    is constant.

    \item An \dfn{ultramagic square} is pandiagonal and associative.
    
    \item A \dfn{latin square} of size \eqn{n\times n}{n-by-n} is one in
    which each column and each row comprises the integers 1 to n (not
    necessarily in that order).  Function \code{is.latin()} is a wrapper
    for \code{is.latinhypercube()} because there is no natural way to
    present the extra information given when \code{give.answers} is
    \code{TRUE} in a manner consistent with the other functions
    documented here.
    
    \item An \dfn{antimagic square} is one whose row sums and column
    sums are consecutive integers; a \dfn{totally antimagic square} is
    one whose row sums, column sums, and two unbroken diagonals are
    consecutiveintegers.  Observe that an antimagic square is not
    necessarily totally antimagic, and vice-versa.

    \item A \dfn{heterosquare} has all rowsums and column sums
    distinct; a \dfn{totally heterosquare} [NB nonstandard terminology]
    has all rowsums, columnsums, and two long diagonals distinct.
    
    \item A square is \dfn{sam} (or \dfn{SAM}) if it is sparse and
    antimagic; it is  \dfn{stam} (or \dfn{STAM}) if it is sparse and
    totally antimagic.  See documentation at \code{SAM}.
   
  }
}
\value{
  Returns \code{TRUE} if the square is semimagic, etc. and \code{FALSE}
   if not.
 
  If \code{give.answers} is taken as an argument and is \code{TRUE},
  return a list of at least five elements.  The first element of the
  list is the answer: it is \code{TRUE} if the square is (semimagic,
  magic, panmagic) and \code{FALSE} otherwise.  Elements 2-5 give the
  result of a call to \code{allsums()}, viz: rowwise and columnwise
  sums; and broken major (ie NW-SE) and minor (ie NE-SW) diagonal sums.

  Function \code{is.bree.correct()} also returns the sums of
  elements distant \eqn{n/2} along a major diagonal
  (\code{diag.sums}); and function \code{is.2x2.correct()} returns the
  sum of each \eqn{2\times 2}{2x2} submatrix (\code{tbt.sums}); for
  other size windows use \code{subsums()} directly.
  Function \code{is.mostperfect()} returns both of these.

  Function \code{is.semimagic.default()} returns \code{TRUE} if the
  argument is semimagic [with respect to \code{sum()}] using a faster
  method than \code{is.semimagic()}.
}
\note{
  Functions that take a \code{func} argument apply that function to each
  row, column, and diagonal as necessary.  If \code{func} takes its
  default value of \code{sum()}, the sum will be returned; if
  \code{prod()}, the product will be returned, and so on.  There are
  many choices for this argument that produce interesting tests;
  consider \code{func=max}, for example.  With this, a \dQuote{magic}
  square is one whose row, sum and (unbroken) diagonals have identical
  maxima.  Thus \code{diag(5)} is magic with respect to \code{max()},
  but \code{diag(6)} isn't.

  Argument \code{boolean} is designed for use with non-default values
  for the \code{func} argument; for example, a latin square is semimagic
  with respect to \code{func=function(x){all(diff(sort(x))==1)}}.
    
  Function \code{is.magic()} is vectorized; if a list is supplied, the
  defaults are assumed.
}
\references{\url{http://mathworld.wolfram.com/MagicSquare.html}}
\author{Robin K. S. Hankin}
  
\seealso{\code{\link{minmax}},\code{\link{is.perfect}},\code{\link{is.semimagichypercube}},\code{\link{sam}}}
\examples{
is.magic(magic(4))

is.magic(diag(7),func=max)  # TRUE
is.magic(diag(8),func=max)  # FALSE

stopifnot(is.magic(magic(3:8)))

is.panmagic(panmagic.4())
is.panmagic(panmagic.8())

data(Ollerenshaw)
is.mostperfect(Ollerenshaw)

proper.magic <- function(m){is.magic(m) & is.normal(m)}
proper.magic(magic(20))
}
\keyword{array}
