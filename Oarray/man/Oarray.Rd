\name{Oarray}

\alias{Oarray}
\alias{as.Oarray}
\alias{as.array.Oarray}
\alias{is.Oarray}

\alias{Oarray-class}
\alias{slice.index,Oarray-method}

\alias{[.Oarray}
\alias{[<-.Oarray}
\alias{print.Oarray}



\title{Arrays with arbitrary offsets}

\description{The traditional \R array has extents which are
indexed with integers that start at 1.  This is generalized to
arbitrary offsets, where extent \code{i} is indexed with integers
that start at \code{offset[i]}, which must be no less than zero
to accomodate the \R convention of dropping components with
negative indices.  In order to use negative offsets, the flag
\code{drop.negative} can be set \code{FALSE}.}

\usage{
Oarray(data=NA, dim=length(data), dimnames=NULL, offset=rep(1, length(dim)),
  drop.negative=TRUE)
as.Oarray(x, offset=rep(1, length(dim)), drop.negative=TRUE)
\method{as.array}{Oarray}(x, ...)
\method{print}{Oarray}(x, ...)
}

\arguments{
  \item{data, dim, dimnames, drop}{As in the function \code{array}}
  \item{offset}{Vector of first index values for each extent (defaults
  to 1s); a length-one argument will be silently recycled to the
  appropriate length}
  \item{drop.negative}{Should negative subscripts indicate exclusion?}
  \item{x}{An array, possibly of class \sQuote{Oarray}}
  \item{...}{Additional arguments to \code{print} or \code{as.array()}}
}

\details{
Typical uses are
\preformatted{
  x[i, j]
  x[i, j] <- someValues
}
where \code{x} is an object of class \sQuote{Oarray} and \code{i},
\code{j} are indices specifying which elements to extract or replace.

Indexing may be via a logical matrix, which indicates which elements to select.

Indexing may be via a single numeric matrix with the one column for each
dimension: the offset is \code{sweep()}-ed out.  See \code{Extract.Rd}
for details.

The use of \code{drop.negative = FALSE} will only work in
\code{[.Oarray} where it is provided as the final argument inside
the square brackets.
}

\value{Typically an array, either with or without the \sQuote{Oarray} class
attribute.  Extracting from an \sQuote{Oarray} object unclasses the
result which is then a simple array, but assigning into an
\sQuote{Oarray} object leaves the result as an \sQuote{Oarray}
object.

The print method provides more informative extent labelling in
the case where dimnames are not provided.
}

\author{Jonathan Rougier, \email{j.c.rougier@bristol.ac.uk}}


\section{Side effects}{The function \code{base::as.array} is redefined
as generic, to provide an \code{as.array.Oarray} method.}

\seealso{\code{\link{array}},\code{\link{Extract}}}

\examples{
fred <- Oarray(1:24, 2:4, list(c("sad", "happy"), NULL, NULL),
  offset=rep(7, 3))

tmp <- as.array(fred)
fred1 <- as.Oarray(tmp, offset=rep(7, 3))
stopifnot(identical(fred, fred1))

print.default(fred)  # print method provides numbers for
fred                 # non-named extents

# examples of extraction

fred[] # unclasses fred
fred["sad", 7, -9]
fred["sad", 7, -9, drop=FALSE]
fred[-8, , 7:8]

i <- 8:9; fred[, , i+1]
how.I.feel <- "happy"; fred[how.I.feel, , -(7:8)]

# examples of assignment

fred["sad", 7, -9] <- NA
fred[, , i] <- 100
fred[how.I.feel, , -(7:8)] <- Inf

# now use negative offsets and suppress usual behaviour

fred <- Oarray(24:1, 2:4, offset=c(-1, -2, 7), drop.negative=FALSE)
fred[] <- 1:24
fred[-(1:0), , 7:8]
fred[-(1:0), , 7:8] <- 100
dimnames(fred) <- list(c("sad", "happy"), NULL, NULL)
fred["sad", -2, 10] <- NA


# array and logical indexing

a <- Oarray(0, dim=rep(2,4),offset=rep(0,4))
a[diag(4)] <- 1

a[a == 0] <- NA

}

\keyword{array}
