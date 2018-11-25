\name{Ops.mvp}
\alias{Ops.mvp}
\alias{Ops}
\alias{simplify}
\alias{mvp_prod}
\alias{mvp_add}
\alias{mvp_power}
\alias{mvp_negative}
\alias{mvp_times_mvp}
\alias{mvp_times_scalar}
\alias{mvp_plus_mvp}
\alias{mvp_plus_numeric}
\alias{mvp_plus_scalar}
\alias{mvp_power_scalar}
\alias{mvp_eq_mvp}
\title{Arithmetic Ops Group Methods for mvp objects}
\description{
  Allows arithmetic operators to be used for
  multivariate polynomials  such as addition, multiplication,
  integer powers, etc.
}
\usage{
\method{Ops}{mvp}(e1, e2)
simplify(allnames,allpowers,coefficients)
mvp_prod(allnames1,allpowers1,coefficients1,allnames2,allpowers2,coefficients2)
mvp_add(allnames1, allpowers1, coefficients1, allnames2, allpowers2, coefficients2)
mvp_power(allnames, allpowers, coefficients, n) 
mvp_negative(S)
mvp_times_mvp(S1,S2)
mvp_times_scalar(S,x)
mvp_plus_mvp(S1,S2)
mvp_plus_numeric(S,x)
mvp_eq_mvp(S1,S2)
}
\arguments{
  \item{e1,e2,S,S1,S2}{Objects of class \dQuote{\code{mvp}}}
  \item{x}{Scalar, length one numeric vector}
  \item{n}{Integer}
  \item{allnames,allpowers,coefficients,allnames1, allpowers1,
    coefficients1, allnames2, allpowers2, coefficients2}{Arguments for
    low-level functions}
}
\details{
  The function \code{Ops.mvp()} passes unary and binary arithmetic
  operators (\dQuote{\code{+}}, \dQuote{\code{-}}, \dQuote{\code{*}}, and
  \dQuote{\code{/}}) to the appropriate specialist function.

  The most interesting operator is \dQuote{\code{*}}, which is passed to
  \code{mvp_times_mvp()}.  
}
\value{
The high-level functions return an object of \code{mvp}, the low-level
  functions return lists.
}
\note{
  The \dQuote{\code{A}} at the beginning of a function name means
  \strong{A}ny mvp.  Thus \code{Ainv()} takes quaternionic or
  octmvpic arguments, but \code{OprodO()} takes only octmvps.
}
\author{Robin K. S. Hankin}
\examples{
6+7
}
\keyword{symbolmath}
