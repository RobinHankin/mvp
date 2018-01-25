\name{hadamard}
\alias{hadamard}
\alias{is.hadamard}
\alias{sylvester}
\title{Hadamard matrices}
\description{
  Various functionality for Hadamard matrices
}
\usage{
sylvester(k)
is.hadamard(m)
}
\arguments{
  \item{k}{Function \code{sylvester()} gives the \code{k}-th Sylvester
    matrix} 
  \item{m}{matrix}
}
\details{
  A \dfn{Hadamard matrix} is a square matrix whose entries are either +1
  or -1 and whose rows are mutually orthogonal.  
} 
\references{
\dQuote{Hadamard matrix.} \emph{Wikipedia, The Free Encyclopedia.} 19 Jan 2009, 18:21 UTC. 20 Jan 2009 
}
\author{Robin K. S. Hankin}
\examples{
is.hadamard(sylvester(4))
image(sylvester(5))

}
\keyword{array}
