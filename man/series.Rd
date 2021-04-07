\name{series}
\alias{series}
\alias{taylor}
\alias{trunc}
\alias{trunc1}
\alias{print.series}
\alias{mvp_taylor_allvars}
\alias{mvp_taylor_onevar}
\alias{mvp_taylor_onepower_onevar}
\alias{mvp_to_series}
\alias{onevarpow}
\title{Decomposition of multivariate polynomials by powers}
\description{Power series of multivariate polynomials, in
  various forms}
\usage{
trunc(S,n)
trunc1(S,...)
series(S,v,showsymb=TRUE)
\method{print}{series}(x,...)
onevarpow(S,...)
taylor(S,vx,va,debug=FALSE)
mvp_taylor_onevar(allnames,allpowers,coefficients, v, n)
mvp_taylor_allvars(allnames,allpowers,coefficients, n)
mvp_taylor_onepower_onevar(allnames, allpowers, coefficients, v, n)
mvp_to_series(allnames, allpowers, coefficients, v)
}
\arguments{
  \item{S}{Object of class \code{mvp}}
  \item{n}{Non-negative integer specifying highest order to be retained}
  \item{v}{Variable to take Taylor series with respect to.   If missing,
    total power of each term is used (except for \code{series()} where
    it is mandatory)}
  \item{x,...}{Object of class \code{series} and further arguments,
    passed to the print method; in \code{trunc1()} a list of variables
    to truncate}
  \item{showsymb}{In function \code{series()}, Boolean, with default
    \code{TRUE} meaning to substitute variables like \code{x_m_foo} with
    \code{(x-foo)} for readability reasons; see the vignette for a
    discussion}
  \item{vx,va,debug}{In function \code{taylor()}, names of variables to
    take series with respect to; and a Boolean with default \code{FALSE}
    meaning to return the mvp and \code{TRUE} meaning to return
    the string that is passed to \code{eval()}}
  \item{allnames,allpowers,coefficients}{Components of \code{mvp}
    objects}

}
\details{

  Function \code{onevarpow()} returns just the terms in which symbol
  \code{v} appears with power \code{n}.
  
  Function \code{series()} returns a power series expansion of powers of
  variable \code{v}.  The value returned is a list of three elements
  named \code{mvp}, \code{varpower}, and \code{variablename}.  The first
  element is a list of \code{mvp} objects and the second is an integer
  vector of powers of variable \code{v} (element \code{variablename} is
  a character string holding the variable name, argument \code{v}).

  Function \code{trunc(S,n)} returns the terms of \code{S} with the sum
  of the powers of the variables \eqn{\leq n}{<=n}.  Alternatively, it
  discards all terms with total power \eqn{>n}.

  Function \code{trunc1()} is similar to \code{trunc()}.  It takes a
  \code{mvp} object and an arbitrary number of named arguments, with
  names corresponding to variables and their values corresponding to the
  highest power in that variable to be retained.  Thus
  \code{trunc1(S,x=2,y=4)} will discard any term with variable \code{x}
  raised to the power 3 or above, and also any term with variable
  \code{y} raised to the power 5 or above.  The highest power of
  \code{x} will be 2 and the highest power of \code{y} will be 4.
  
  Function \code{series()} returns an object of class \code{series}; the
  print method for \code{series} objects is sensitive to the value of
  \code{getOption("mvp_mult_symbol")}; set this to \code{"*"} to get
  \code{mpoly}-compatible output.

  Function \code{taylor()} is a convenience wrapper for \code{series()}.
  
  Functions \code{mvp_taylor_onevar()}, \code{mvp_taylor_allvars()} and
  \code{mvp_to_series()} are low-level helper functions that are not
  intended for the user.

}
\author{Robin K. S. Hankin}
\seealso{\code{\link{deriv}}}
\examples{
trunc(as.mvp("1+x")^6,2)

trunc(as.mvp("1+x+y")^3,2)      # neglects all terms with total power>2
trunc1(as.mvp("1+x+y")^3,x=2) # terms like y^3 are treated as constants

p <- horner("x+y",1:4)

onevarpow(p,x=2)   # coefficient of x^2
onevarpow(p,x=3)   # coefficient of x^3

onevarpow(as.mvp("1+x+x*y^2  + z*y^2*x"),x=1,y=2)

series(rmvp(10),"a")

# Works well with pipes:

f <- function(n){as.mvp(sub('n',n,'1+x^n*y'))}
Reduce(`*`,lapply(1:6,f)) \%>\% series('y')
Reduce(`*`,lapply(1:6,f)) \%>\% series('x')


p \%>\% trunc(2)
p \%>\% trunc1(x=2)
(p \%>\% subs(x="x+dx") -p) \%>\% trunc1(dx=2)


## Third order taylor expansion of f(x)=sin(x+y) for x=1.1, about x=1:
sinxpy <- horner("x+y",c(0,1,0,-1/6,0,+1/120,0,-1/5040,0,1/362880))  # sin(x+y)
dx <- as.mvp("dx")
t3 <- sinxpy  + aderiv(sinxpy,x=1)*dx + aderiv(sinxpy,x=2)*dx^2/2 + aderiv(sinxpy,x=3)*dx^3/6
t3 \%<>\% subs(x=1,dx=0.1)  # t3 = Taylor expansion of sin(y+1.1)
t3 \%>\% subs(y=0.3)  - sin(1.4)  # numeric; should be small
}
\keyword{symbolmath}
