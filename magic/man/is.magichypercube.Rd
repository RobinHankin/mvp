\name{is.magichypercube}
\alias{is.semimagichypercube}
\alias{is.magichypercube}
\alias{is.nasik}
\alias{is.alicehypercube}
\alias{is.perfect}
\alias{is.diagonally.correct}
\alias{is.latinhypercube}
\title{magic hypercubes}
\description{
Returns \code{TRUE} if a hypercube is semimagic, magic, perfect
}
\usage{
is.semimagichypercube(a, give.answers=FALSE, func=sum, boolean=FALSE, ...)
is.diagonally.correct(a, give.answers = FALSE, func=sum, boolean=FALSE, ...) 
is.magichypercube(a, give.answers = FALSE, func=sum, boolean=FALSE, ...) 
is.perfect(a, give.answers = FALSE, func=sum, boolean=FALSE)
is.latinhypercube(a, give.answers=FALSE)
is.alicehypercube(a,ndim,give.answers=FALSE, func=sum, boolean=FALSE)
}
\arguments{
  \item{a}{The hypercube (array) to be tested}
  \item{give.answers}{Boolean, with \code{TRUE} meaning to also return
    the sums}
  \item{func}{Function to be applied across each dimension}
  \item{ndim}{In \code{is.alicehypercube()}, dimensionality of
    subhypercube to take sums over.  See the details section}
  \item{boolean}{Boolean, with \code{TRUE} meaning that the hypercube is
    deemed magic, semimagic, etc, if all applications of \code{func}
    evaluate to \code{TRUE}.  If \code{boolean} is \code{FALSE}, the
    hypercube is magic etc if all applications of \code{func} are
    identical}
  \item{...}{Further arguments passed to \code{func()}}
}
\details{
  (Although apparently non-standard, here a hypercube is defined to have
  dimension \eqn{d} and order \eqn{n}---and thus has \eqn{n^d}
  elements).

  \itemize{
    \item A \dfn{semimagic hypercube} has all \dQuote{rook's move} sums
    equal to the magic constant (that is, each \eqn{\sum
    a[i_1,i_2,\ldots,i_{r-1},,i_{r+1}, \ldots,i_d]}{sum(a[i_1,i_2,
    \ldots,i_{r-1},,i_{r+1},\ldots,i_d])} with \eqn{1\leq r\leq d}{1 <=
    r <= d} is equal to the magic constant for all values of the
    \eqn{i}'s).  In \code{is.semimagichypercube()}, if
    \code{give.answers} is \code{TRUE}, the sums returned are in the
    form of an array of dimension \code{c(rep(n,d-1),d)}.  The first
    \code{d-1} dimensions are the coordinates of the projection of the
    summed elements onto the surface hypercube.  The last dimension
    indicates the dimension along which the sum was taken over.

    Optional argument \code{func}, defaulting to \code{sum()}, indicates
    the function to be taken over each of the \code{d} dimensions.
    Currently requires \code{func} to return a scalar.
  
    \item A \dfn{Latin hypercube} is one in which each line of elements
    whose coordinates differ in only one dimension comprises the numbers
    \eqn{1} to \eqn{n} (or \eqn{0} to \eqn{n-1}), not necessarily in
    that order.  Each integer thus appears \eqn{n^{d-1}} times.
  
    \item A \dfn{magic hypercube} is a semimagic hypercube with the
    additional requirement that all \eqn{2^{d-1}}{2^(d-1)} long (ie
    extreme point-to-extreme point) diagonals sum correctly.  Correct
    diagonal summation is tested by \code{is.diagonally.correct()}; by
    specifying a function other than \code{sum()}, criteria other than
    the diagonals returning the correct sum may be tested.

    \item An \dfn{Alice hypercube} is a different generalization of a
    semimagic square to higher dimensions.  It is named for A. M. Hankin
    (\dQuote{Alice}), who originally suggested it.

    A semimagic hypercube has all one-dimensional subhypercubes (ie
    lines) summing correctly.  An Alice hypercube is one in which all
    \code{ndim}-dimensional subhypercubes have the same sum, where
    \code{ndim} is a fixed integer argument.  Thus, if \code{a} is a
    hypercube of size \eqn{n^d}{n^d}, \code{is.alicehypercube(a,ndim)}
    returns \code{TRUE} if all \code{n^{d-ndim}} subhypercubes have the
    same sum.

    For example, if \code{a} is four-dimensional with dimension
    \eqn{5\times 5\times 5\times 5}{5x5x5x5} then
    \code{is.alicehypercube(a,1)} is \code{TRUE} if and only if \code{a}
    is a semimagic hypercube: all \eqn{{4\choose 1}5^3=500}{4*5^3=500}
    one-dimensional subhypercubes have the same sum.  Then
    \code{is.alicehypercube(a,2)} is \code{TRUE} if all 2-dimensional
    subhypercubes (ie all \eqn{{4\choose 2}\times 5^2=150}{6x5^2=150} of
    the \eqn{5\times 5}{5x5} squares, for example \code{a[,2,4,]} and
    \code{a[1,1,,]}) have the same sum.  Then
    \code{is.alicehypercube(a,3)} means that all 3d subhypercubes (ie
    all \eqn{{4\choose 3}\times 5^1=20}{4x5=20} of the \eqn{5\times
    5\times 5}{5x5x5} cubes, for example \code{a[,,1,]} and
    \code{a[4,,,]}) have the same sum.  For any hypercube \code{a},
    \code{is.alicehypercube(a,dim(a))} returns \code{TRUE}.

    A semimagic hypercube is an Alice hypercube for any value of
    \code{ndim}.
    
    \item A \dfn{perfect magic hypercube} (use \code{is.perfect()}) is
    a magic hypercube with all nonbroken diagonals summing correctly.
    This is a seriously restrictive requirement for high dimensional
    hypercubes.  As yet, this function does not take a
    \code{give.answers} argument.

    \item A \dfn{pandiagonal magic hypercube}, also \dfn{Nasik
    hypercube} (or sometimes just a \dfn{perfect hypercube}) is a
    semimagic hypercube with all diagonals, including broken diagonals,
    summing correctly.  This is not implemented.  }

  The terminology in this area is pretty confusing.  
  
  In \code{is.magichypercube()}, if argument \code{give.answers=TRUE}
  then a list is returned.  The first element of this list is Boolean
  with \code{TRUE} if the array is a magic hypercube.  The second
  element and third elements are answers
  from\code{is.semimagichypercube()} and \code{is.diagonally.correct()}
  respectively.

  In \code{is.diagonally.correct()}, if argument
  \code{give.answers=TRUE}, the function also returns an array of
  dimension \code{c(q,rep(2,d))} (that is, \eqn{q\times 2^d}{q*2^d}
  elements), where \eqn{q}{q} is the length of \code{func()} applied to a
  long diagonal of \code{a} (if \eqn{q=1}{q=1}, the first dimension is
  dropped).  If \eqn{q=1}, then in dimension \code{d} having index 1
  means \code{func()} is applied to elements of \code{a} with the
  \eqn{d^{\rm th}}{d-th} dimension running over \code{1:n}; index 2
  means to run over \code{n:1}.  If \eqn{q>1}, the index of the first
  dimension gives the index of \code{func()}, and subsequent dimensions
  have indices of 1 or 2 as above and are interpreted in the same way.

  An example of a function for which these two are not identical is
  given below.

  If \code{func=f} where \code{f} is a function returning a vector of
  length \code{i}, \code{is.diagonally.correct()} returns an array
  \code{out} of dimension \code{c(i,rep(2,d))}, with
  \code{out[,i_1,i_2,...,i_d]} being \code{f(x)} where \code{x} is the
  appropriate long diagonal.  Thus the \eqn{2^d} equalities
  \code{out[,i_1,i_2,...,i_d]==out[,3-i_1,3-i_2,...,3-i_d]} hold if and
  only if \code{identical(f(x),f(rev(x)))} is \code{TRUE} for each long
  diagonal (a condition met, for example, by \code{sum()} but not by the
  identity function or \code{function(x){x[1]}}).
}
\references{
  \itemize{
    \item
    R. K. S. Hankin 2005.  \dQuote{Recreational mathematics with R:
      introducing the \pkg{magic} package}.  R news, 5(1)
    \item
    Richards 1980. \dQuote{Generalized magic cubes}.
    \emph{Mathematics Magazine}, volume 53, number 2, (March).
  }
}
\author{Robin K. S. Hankin}
\note{

On this page, \dQuote{subhypercube} is restricted to
rectangularly-oriented subarrays; see the note at \code{subhypercubes}.
  
Not all subhypercubes of a magic hypercube are necessarily magic! (for
example, consider a 5-dimensional magic hypercube \code{a}.  The square
\code{b} defined by \code{a[1,1,1,,]} might not be magic: the diagonals
of \code{b} are not covered by the definition of a magic hypercube).
Some subhypercubes of a magic hypercube are not even semimagic: see
below for an example.

Even in three dimensions, being perfect is pretty bad.  Consider a
\eqn{5\times5\times 5}{5x5x5} (ie three dimensional), cube.  Say
\code{a=magiccube.2np1(2)}.  Then the square defined by
\code{sapply(1:n,function(i){a[,i,6-i]}, simplify=TRUE)}, which is a
subhypercube of \code{a}, is not even semimagic: the rowsums are
incorrect (the colsums must sum correctly because \code{a} is magic).
Note that the diagonals of this square are two of the \dQuote{extreme
point-to-point} diagonals of \code{a}.

A \dfn{pandiagonal magic hypercube} (or sometimes just a \dfn{perfect
hypercube}) is semimagic and in addition the sums of all diagonals,
including broken diagonals, are correct.  This is one seriously bad-ass
requirement.  I reckon that is a total of \eqn{\frac{1}{2}\left(
3^d-1\right)\cdot n^{d-1}}{(3^d-1)n^(d-1)/2} correct summations.  This
is not coded up yet; I can't see how to do it in anything like a
vectorized manner.
}
  
\seealso{\code{\link{is.magic}}, \code{\link{allsubhypercubes}}, \code{\link{hendricks}}}
\examples{
library(abind)
is.semimagichypercube(magiccube.2np1(1))
is.semimagichypercube(magichypercube.4n(1,d=4))

is.perfect(magichypercube.4n(1,d=4))

# Now try an array with minmax(dim(a))==FALSE:
a <- abind(magiccube.2np1(1),magiccube.2np1(1),along=2)
is.semimagichypercube(a,g=TRUE)$rook.sums

# is.semimagichypercube() takes further arguments:
mymax <- function(x,UP){max(c(x,UP))}
not_mag  <- array(1:81,rep(3,4))
is.semimagichypercube(not_mag,func=mymax,UP=80)  # FALSE
is.semimagichypercube(not_mag,func=mymax,UP=81)  # TRUE


a2 <- magichypercube.4n(m=1,d=4)
is.diagonally.correct(a2)
is.diagonally.correct(a2,g=TRUE)$diag.sums

## To extract corner elements (note func(1:n) != func(n:1)):
is.diagonally.correct(a2,func=function(x){x[1]},g=TRUE)$diag.sums 


#Now for a subhypercube of a magic hypercube that is not semimagic:
is.magic(allsubhypercubes(magiccube.2np1(1))[[10]])

data(hendricks)
is.perfect(hendricks)


#note that Hendricks's magic cube also has many broken diagonals summing
#correctly:

a <- allsubhypercubes(hendricks)
ld <- function(a){length(dim(a))}

jj <- unlist(lapply(a,ld))
f <- function(i){is.perfect(a[[which(jj==2)[i]]])}
all(sapply(1:sum(jj==2),f))

#but this is NOT enough to ensure that it is pandiagonal (but I
#think hendricks is pandiagonal).


is.alicehypercube(magichypercube.4n(1,d=5),4,give.answers=TRUE)

}
\keyword{array}
