\name{coeffs}
\alias{Ops.coeffs}
\alias{coeffs}
\alias{coeffs.mvp}
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

  Function \code{coeffs()} allows arithmetic operators to be used for
  the coefficients of multivariate polynomials, bearing in mind that the
  order of coefficients is not determined.  It uses the \code{disord}
  class of the \CRANpkg{disordR} package.

\dQuote{Pure} extraction and replacement (as in \code{a[i]} and
\code{a[i] <- value} is implemented exprimentally.  The code for
extraction is cute but not particularly efficient.
  
}
\usage{
coeffs(x)
vars(x)
powers(x)
coeffs(x) <- value
}
\arguments{
  \item{x}{Object of class \code{disord}}
  \item{value}{Object of class \code{disord}, or length-1 numeric vector}
}
\details{

  (much of the discussion below appears in the vignette of the
  \CRANpkg{disordR} package). 

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
  \mjseqn{x+3y+4xy^3=4xy^3+x+3y}).  Thus the coefficients of the
  multinomial might be \code{c(1,3,4)} or \code{c(4,1,3)}, or indeed any
  ordering.  But note that any particular ordering imposes an ordering
  on the terms.  If we choose \code{c(1,3,4)} then the terms are
  \code{x,y,xy^3}, and if we choose \code{c(4,1,3)} the terms are
  \code{xy^3,x,y}.

  In the package, \code{coeffs()} returns an object of class
  \code{disord}.  This class of object has a slot for the coefficients
  in the form of a numeric R vector, but also another slot which uses
  hash codes to prevent users from misusing the ordering of the numeric
  vector.
   
  For example, a multinomial \code{x+2y+3z} might have coefficients
  \code{c(1,2,3)} or \code{c(3,1,2)}.  Package idiom to extract the
  coefficients of a multivariate polynomial \code{a} is
  \code{coeffs(a)}; but this cannot return a standard numeric vector
  because a numeric vector has elements in a particular order, and the
  coefficients of a multivariate polynomial are stored in an
  implementation-specific (and thus unknown) order.
  
  Suppose we have two multivariate polynomials, \code{a} as defined as
  above with \code{a=x+2y+3z} and \code{b=x+3y+4z}.  Even though
  \code{a+b} is well-defined algebraically, and \code{coeffs(a+b)} will
  return a well-defined \code{mvp_coeffs} object, idiom such as
  \code{coeffs(a) + coeffs(b)} is not defined because there is no
  guarantee that the coefficients of the two multivariate polynomials
  are stored in the same order.  We might have
  \code{c(1,2,3)+c(1,3,4)=c(2,5,7)} or
  \code{c(1,2,3)+c(1,4,3)=c(2,6,6)}, with neither being more
  \dQuote{correct} than the other.  In the package, \code{coeffs(a) +
  coeffs(b)} will return an error.  In the same way \code{coeffs(a) +
  1:3} is not defined and will return an error.  Further, idiom such as
  \code{coeffs(a) <- 1:3} and \code{coeffs(a) <- coeffs(b)} are not
  defined and will return an error.  However, note that \code{coeffs(a)
  + coeffs(a)} and \code{coeffs(a)+coeffs(a)^2} are fine, these
  returning a \code{mvp_coeffs} object specific to \code{a}.

  Idiom such as \code{coeffs(a) <- coeffs(a)^2} is fine too, for one
  does not need to know the order of the coefficients on either side, so
  long as the order is the same on both sides.  That would translate
  into idiomatic English: \dQuote{the coefficient of each term of
  \code{a} becomes its square}; note that this operation is insensitive
  to the order of coefficients.  The whole shebang is intended to make
  idiom such as \code{coeffs(a) <- coeffs(a)\%\%2} possible (so we can
  manipulate polynomials over finite rings, here \mjseqn{Z/2Z}).

  The replacement methods are defined so that an expression like
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

  \itemize{
    \item\preformatted{coeffs(a)[coeffs(a)<5] <- 4+coeffs(a)[coeffs(a)<5]}
    \item\preformatted{coeffs(a) <- pmax(a,3)}
  }

  is algebraically meaningful (\dQuote{Add 4 to any element less than
  5}; \dQuote{coefficients become the pairwise maximum of themselves and
  3}).  The \CRANpkg{disordR} package uses \code{pmaxdis()} rather than
  \code{pmax()} for technical reasons.

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

}
\author{Robin K. S. Hankin}
\examples{

(x <- 5+rmvp(6))
(y <- 2+rmvp(6))

coeffs(x)^2
coeffs(y) <- coeffs(y)\%\%3  # fine, all coeffs of y now modulo 3
y

coeffs(y) <- 4               
y

\dontrun{
coeffs(x) <- coeffs(y)          # not defined, will give an error
coeffs(x) <- seq_len(nterms(x)) # not defined, will give an error
}

}
\keyword{symbolmath}
