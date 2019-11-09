\name{coeffs}
\alias{Ops.coeffs}
\alias{coeffs}
\alias{Ops.mvp_coeffs}
\alias{hash}
\alias{as_coeffs}
\alias{is.coeffs}
\alias{print.coeffs}
\alias{print.mvp_coeffs}
\alias{accessors}
\alias{vars}
\alias{powers}
\alias{coeffs}
\alias{coeffs<-}
\alias{coeffs<-.mvp}
\alias{coefficients}
\alias{consistent}
\alias{\%~\%}
\title{Functionality for \code{coeffs} objects}
\description{
  Allows arithmetic operators to be used for the coefficients of
  multivariate polynomials, bearing in mind that the order of
  coefficients is not determined. 
}
\usage{
\method{Ops}{mvp_coeffs}(e1, e2=NULL)
as_coeffs(v,h)
is.coeffs(x)
hash(x)
\method{print}{mvp_coeffs}(x, ...)
vars(x)
powers(x)
coeffs(x)
coeffs(x) <- value
consistent(x,y)
x \%~\% y
}
\arguments{
  \item{x,y,e1,e2}{Objects of class \code{coeffs}}
\item{...}{Further arguments}
\item{v}{Vector of coefficients}
\item{h}{Hash code}
\item{value}{Replacement coefficients}
}
\details{

  Accessing elements of an \code{mvp} object is problematic because the
  order of the terms of an \code{mvp} object is not well-defined.  This
  is because the \code{map} class of the \code{STL} does not specify an
  order for the key-value pairs (and indeed the actual order in which
  they are stored may be implementation dependent).  The situation is
  similar to the \code{hyper2} package which uses the \code{STL} in a
  similar way.
  
  A \code{coeffs} object is a vector of coefficients of a \code{mvp}
  object.  But it is not a conventional vector; in a conventional
  vector, we can identify the first element unambiguously, and the
  second, and so on.  An \code{mvp} is a map from terms to coefficients,
  and a map has no intrinsic ordering: the maps

  \preformatted{{x -> 1, y -> 3, xy^3 -> 4}}

  and \preformatted{{xy^3 -> 4, x -> 1, y -> 3}}
  
  are the same map and correspond to the same multinomial (symbolically,
  \eqn{x+3y+4xy^3=4xy^3+x+3y}).  Thus the coefficients of the
  multinomial might be \code{c(1,3,4)} or \code{c(4,1,3)}, or indeed any
  ordering.  But note that any particular ordering imposes an ordering
  on the terms.  If we choose \code{c(1,3,4)} then the terms are
  \code{x,y,xy^3}, and if we choose \code{c(4,1,3)} the terms are
  \code{xy^3,x,y}.

  Likewise a multinomial \code{x+2y+3z} might have coefficients
  \code{c(1,2,3)} or \code{c(3,1,2)}
  
  So even though \code{a+b} is well-defined, idiom such as
  \code{coeffs(a) + coeffs(b)} is not defined: we might have
  \code{c(1,3,4)+c(1,2,3)=c(2,5,7)} or
  \code{c(1,3,4)+c(1,3,2)=c(2,6,6)}, with neither being more
  \dQuote{correct} than the other.  In the package, \code{coeffs(a) +
  coeffs(b)} will return an error.  In the same way \code{coeffs(a) +
  1:3} is not defined and will return an error.  In the same way, idiom
  such as \code{coeffs(a) <- 1:3} and \code{coeffs(a) <- coeffs(b)} are
  not defined and will return an error.  However, note that
  \code{coeffs(a) + coeffs(a)} and \code{coeffs(a)+coeffs(a)^2} are
  fine, these returning a \code{coeffs} object specific to \code{a}.

  Idiom such as \code{coeffs(a)
  <- coeffs(a)^2} is fine too, for one does not need to know the order
  of the coefficients on either side, so long as the order is the same
  on both sides.  That would translate into idiomatic English:
  \dQuote{the coefficient of each term of \code{a} becomes its square};
  note that this operation is insensitive to the order of coefficients.
  The whole shebang is intended to make idiom such as \code{coeffs(a) <-
  coeffs(a)\%\%2} possible (so we can manipulate polynomials over finite
  rings, here \eqn{Z/2Z}).

  The replacement methods are defined so that expressions like
  \code{coeffs(a)[coeffs(a) > 5] <- 5} works as expected; the English
  idiom would be \dQuote{Replace any coefficient greater than 5 with 5}.

  To fix ideas, consider \code{a <- rmvp(8)}.  Extraction presents
  issues; consider \code{coeffs(a)<5}.  This object has Boolean elements
  but has the same ordering ambiguity as \code{coeffs(a)}.  One might
  expect that we could use this to extract elements of \code{coeffs(a)},
  specifically elements less than 5.  However,
  \code{coeffs(a)[coeffs(a)<5]} in isolation is meaningless: what can be
  done with such an object?  However, it makes sense on the left hand
  side of an assignment, as long as the right hand side is a length-one
  vector.  Idiom such as

  \preformatted{coeffs(a)[coeffs(a)<5] <- 4+coeffs(a)[coeffs(a)<5]}

  is arguably meaningful (\dQuote{Add 4 to any element less than 5}) but
  is not implemented because replacement methods in R require the RHS to
  be evaluated; also there is no ready way to check for (meaningless)
  idiom such as \code{coeffs(a)[coeffs(a)<5] <-
  4+coeffs(a)[coeffs(a)>3]}.  Further note that \code{coeffs(a) <-
  rev(coeffs(a))} is disallowed (as indeed is \code{coeffs(a) <-
  sample(coeffs(a))}, although arguably that should be OK).


  The function \code{Ops.coeffs()} passes unary and binary arithmetic
  operators to the appropriate specialist function using a system of
  hash code (created by function \code{hash()}) that prevents one from
  misusing the arbitrary ordering of the coefficients returned by
  \code{coeffs()}.

  So the output of \code{coeffs(x)} is defined only up to an unknown
  rearrangement.  The same considerations apply to the output of
  \code{vars()}, which returns a list of character vectors in an
  undefined order, and the output of \code{powers()}, which returns a
  numeric list whose elements are in an undefined order.  However, even
  though the order of these three objects is undefined individually,
  their ordering is jointly consistent in the sense that the first
  element of \code{coeffs(x)} corresponds to the first element of
  \code{vars(x)} and the first element of \code{powers(x)}.  The
  identity of this element is not defined---but whatever it is, the
  first element of all three accessor methods refers to it.

  Note also that a single term (something like \code{4a^3*b*c^6}) has
  the same issue: the variables are not stored in a well-defined order.
  This does not matter because the algebraic value of the term does not
  depend on the order in which the variables appear and this term would
  be equivalent to \code{4b*c^6*a^3}.

  The vignette provides an extensive discussion of this phenomenon.

}
\author{Robin K. S. Hankin}
\seealso{\code{\link{Ops.mvp}}}
\examples{

x <- 5+rmvp(6)
y <- 2+rmvp(6)
z <- 2+rmvp(6)


coeffs(x)^2
coeffs(z) <- coeffs(z)\%\%3  # fine, all coeffs of z now modulo 3
coeffs(z) <- 4               # also fine, all coeffs  of z now modulo 3

\dontrun{
coeffs(x) <- coeffs(y)          # not defined, will give an error
coeffs(x) <- seq_len(nterms(x)) # not defined, will give an error
}

}
\keyword{symbolmath}
