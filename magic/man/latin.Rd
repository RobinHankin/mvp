\name{latin}
\alias{latin}
\alias{incidence}
\alias{is.incidence}
\alias{is.incidence.improper}
\alias{unincidence}
\alias{inc_to_inc}
\alias{another_latin}
\alias{another_incidence}
\alias{rlatin}
\title{Random latin squares}
\description{
  Various functionality for generating random latin squares
}
\usage{
incidence(a)
is.incidence(a, include.improper)
is.incidence.improper(a)
unincidence(a)
inc_to_inc(a)
another_latin(a)
another_incidence(i)
rlatin(n,size=NULL,start=NULL,burnin=NULL)
}
\arguments{
  \item{a}{A latin square}
  \item{i}{An incidence array}
  \item{n,include.improper,size,start,burnin}{Various control arguments;
    see details section}
}
\details{
  \itemize{
    \item Function \code{incidence()} takes an integer array
    (specifically, a latin square) and returns the incidence array as
    per Jacobson and Matthew 1996
    \item Function \code{is.incidence()} tests for an array being an
    incidence array; if argument \code{include.improper} is \code{TRUE},
    admit an improper array
    \item Function \code{is.incidence.improper()} tests for an array
    being an improper array
    \item Function \code{unincidence()} converts an incidence array to a
    latin square
    \item Function \code{another_latin()} takes a latin square and
    returns a different latin square
    \item Function \code{another_incidence()} takes an incidence array
    and returns a different incidence array
    \item Function \code{rlatin()} generates a (Markov) sequence of
    random latin squres, arranged in a 3D array.  Argument \code{n}
    specifies how many to generate; argument \code{size} gives the size
    of latin squares generated; argument \code{start} gives the start
    latin square (it must be latin and is checked with
    \code{is.latin()}); argument \code{burnin} gives the burn-in value
    (number of Markov steps to discard).

    Default value of \code{NULL} for argument \code{size} means to take
    the size of argument \code{start}; default value of \code{NULL} for
    argument \code{start} means to use \code{circulant(size)}

    As a special case, if argument \code{size} and \code{start} both
    take the default value of \code{NULL}, then argument \code{n} is
    interpreted as the size of a single random latin square to be
    returned; the other arguments take their default values.  This
    ensures that \dQuote{\code{rlatin(n)}} returns a single random
    \eqn{n\times n}{n-by-n} latin square.
  }

From Jacobson and Matthew 1996, an \eqn{n\times n}{n-by-n} latin square
LS is equivalent to an \eqn{n\times n\times n}{n-by-n-by-n} array A with
entries 0 or 1; the dimensions of A are identified with the rows,
columns and symbols of LS; a 1 appears in cell \eqn{(r,c,s)} of A iffi
the symbol \eqn{s} appears in row \eqn{r}, column \eqn{s} of LS.
Jacobson and Matthew call this an \dfn{incidence cube}.

The notation is readily generalized to latin hypercubes and
\code{incidence()} is dimensionally vectorized.

An \dfn{improper} incidence cube is an incidence cube that includes a
single \eqn{-1} entry; all other entries must be 0 or 1; and all line
sums must equal 1.
}
\references{M. T. Jacobson and P. Matthews 1996. \dQuote{Generating
    uniformly distributed random latin squares}.  \emph{Journal of
    Combinatorial Designs}, volume 4, No. 6, pp405--437
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{is.magic}}}
\examples{

rlatin(5)
rlatin(n=2, size=4, burnin=10)

# An example that allows one to optimize an objective function
# [here f()] over latin squares:
gr <- function(x){ another_latin(matrix(x,7,7)) }
set.seed(0)
index <- sample(49,20)
f <- function(x){ sum(x[index])}
jj <- optim(par=as.vector(latin(7)), fn=f, gr=gr, method="SANN", control=list(maxit=10))
best_latin <- matrix(jj$par,7,7)
print(best_latin)
print(f(best_latin))

#compare starting value:
f(circulant(7))


}
\keyword{array}
