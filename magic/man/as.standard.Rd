\name{as.standard}
\alias{as.standard}
\alias{is.standard}
\alias{is.standard.toroidal}
\title{Standard form for magic squares}
\description{
  Transforms a magic square or magic hypercube into
  Frenicle's standard form
}
\usage{
as.standard(a, toroidal = FALSE, one_minus=FALSE)
is.standard(a, toroidal = FALSE, one_minus=FALSE)
}
\arguments{
  \item{a}{Magic square or hypercube (array) to be tested or
    transformed}
  \item{toroidal}{Boolean, with default \code{FALSE} meaning to use
    Frenicle's method, and \code{TRUE} meaning to use additional
    transformations appropriate to toroidal connectivity}
  \item{one_minus}{Boolean, with  \code{TRUE} meaning to use the
    transformation \eqn{x\longrightarrow n^2+1-x}{x -> n^2+1-x} if
    appropriate, 
    and default \code{FALSE} meaning not to use this}
}
\details{
For a square, \code{as.standard()} transforms a magic square into
Frenicle's standard form.  The four numbers at each of
the four corners are determined.  First, the square is rotated so the
smallest of the four is at the upper left.  Then, element \code{[1,2]}
is compared with element\code{[2,1]} and, if it is larger, the transpose
is taken.

Thus all eight rotated and transposed versions of a magic square have
the same standard form.

The square returned by \code{magic()} is in standard form.

For hypercubes, the algorithm is generalized.  First, the hypercube is
reflected so that \code{a[1,1,...,1,1]} is the smallest of the \eqn{2^d}
corner elements (eg \code{a[1,n,1,...,1,1]}).

Next, \code{aperm()} is called so that

\code{a[1,1,...,1,2] < a[1,1,...,2,1] < ... < a[2,1,...,1,1]}.

Note that the inequalities are strict as hypercubes are assumed to be
normal.  As of version 1.3-1, \code{as.standard()} will accept arrays of
any dimension (ie arrays \code{a} with \code{minmax(dim(a))==FALSE} will
be handled sensibly).

An array with any dimension of extent zero is in standard form by
definition; dimensions of length one are dropped.

If argument \code{toroidal} is \code{TRUE}, then the array \code{a} is
translated using \code{ashift()} so that \code{a[1,1,...,1] == min(a)}.
Such translations preserve the properties of semimagicness and
pandiagonalness (but not magicness or associativity).

It is easier (for me at least) to visualise this by considering
two-dimensional arrays, tiling the plane with copies of \code{a}.

Next, the array is shifted so that \code{a[2,1,1,...,1] <
  a[dim(a)[1],1,1,...,1]} and \code{a[1,2,1,..,1] <
  a[1,dim(a)[2],1,...,1]} and so on.

Then \code{aperm()} is called as per the non-toroidal case above.


\code{is.standard()} returns \code{TRUE} if the magic square or
hypercube is in standard form.  \code{is.standard()} and
\code{as.standard()} check for neither magicness nor normality (use
\code{\link{is.magic}} and \code{\link{is.normal}} for this).
}
\note{
  There does not appear to be a way to make the third letter of
  \dQuote{Frenicle} have an acute accent, as it should do.
  }
\author{Robin K. S. Hankin}
\seealso{\code{\link{magic}}, \code{\link{eq}}}
\examples{
is.standard(magic.2np1(4))
as.standard(magic.4n(3))

as.standard(magichypercube.4n(1,5))

##non-square arrays:
as.standard(magic(7)[1:3,])


## Toroidal transforms preserve pandiagonalness:
is.pandiagonal(as.standard(hudson(11)))


## but not magicness:
is.magic(as.standard(magic(10),TRUE))


}
\keyword{array}
