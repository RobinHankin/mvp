\name{notmagic.2n}
\alias{notmagic.2n}
\title{An unmagic square}
\description{
  Returns a square of order \eqn{n=2m} that has been claimed to
  be magic, but isn't.
}
\usage{
notmagic.2n(m)
}
\arguments{
  \item{m}{Order of square is \eqn{n=2m}}
}
\references{\dQuote{Magic Squares and Cubes}, Andrews, (book)}
\author{Robin K. S. Hankin}
\note{This took me a whole evening to code up.  And I was quite pleased
  with the final vectorized form: it matches Andrews's (8 by 8) example
  square exactly.  What a crock}
\examples{
  notmagic.2n(4)
  is.magic(notmagic.2n(4))
  is.semimagic(notmagic.2n(4))

}
\keyword{array}

