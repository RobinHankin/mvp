\name{nqueens}
\alias{nqueens}
\alias{bernhardsson}
\alias{bernhardssonA}
\alias{bernhardssonB}
\title{N queens problem}
\description{
  Solves the N queens problem for any n-by-n board. 
}
\usage{
bernhardsson(n)
bernhardssonA(n)
bernhardssonB(n)
}
\arguments{
  \item{n}{Size of the chessboard}
}
\details{
  Uses a direct transcript of Bo Bernhardsson's method.

  All solutions (up to reflection and translation) for the 8-by-8 case
  given in the examples.
}
\references{
  \itemize{
    \item
    Bo Bernhardsson 1991.  \dQuote{Explicit solutions to the
      n-queens problem for all \eqn{n}}.  \emph{SIGART Bull.}, 2(2):7
    \item Weisstein, Eric W. \dQuote{Queens Problem} From
    \emph{MathWorld--A Wolfram Web Resource}
    \url{http://mathworld.wolfram.com/QueensProblem.html}
    }
  }
\author{Robin K. S. Hankin}
\examples{
bernhardsson(7)

a <-
  matrix(
         c(3,6,2,7,1,4,8,5,
           2,6,8,3,1,4,7,5,
           6,3,7,2,4,8,1,5,
           3,6,8,2,4,1,7,5,
           4,8,1,3,6,2,7,5,
           7,2,6,3,1,4,8,5,
           2,6,1,7,4,8,3,5,
           1,6,8,3,7,4,2,5,
           1,5,8,6,3,7,2,4,
           2,4,6,8,3,1,7,5,
           6,3,1,8,4,2,7,5,
           4,6,8,2,7,1,3,5)
         ,8,12)

out <- array(0L,c(8,8,12))
for(i in 1:12){
  out[cbind(seq_len(8),a[,i],i)] <- 1L
}


}
\keyword{array}
