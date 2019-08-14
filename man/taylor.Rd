\name{taylor}
\alias{taylor}
\alias{series}
\alias{print.series}
\alias{mvp_taylor_allvars}
\alias{mvp_taylor_onevar}
\alias{mvp_taylor_onepower_onevar}
\alias{mvp_to_series}
\alias{onevarpow}
\title{Taylor series}
\description{Truncated Taylor series of multivariate polynomials}
\usage{
taylor(S,n,v)
series(S,v,showsymb=TRUE)
\method{print}{series}(x,...)
onevarpow(S,n,v)
mvp_taylor_onevar(allnames,allpowers,coefficients, n, v)
mvp_taylor_allvars(allnames,allpowers,coefficients, n)
mvp_taylor_onepower_onevar(allnames, allpowers, coefficients, n, v)
mvp_to_series(allnames, allpowers, coefficients, v)
}
\arguments{
  \item{S}{Object of class \code{mvp}}
  \item{n}{Non-negative integer specifying highest order to be retained}
  \item{v}{Variable to take Taylor series with respect to.   If missing,
    total power of each term is used (except for \code{series()} where
    it is mandatory)}
  \item{x,...}{Object of class \code{series} and further arguments,
    passed to the print method}
  \item{showsymb}{In function \code{series()}, Boolean, with default
    \code{TRUE} meaning to substitute variables like \code{x_mfoo} with
    \code{(x-foo)} for readability reasons}
  \item{allnames,allpowers,coefficients}{Components of \code{mvp}
    objects}

}
\details{

  Function \code{taylor()} returns the Taylor series of \code{S} in
  powers of \code{v} up to and including terms \code{v^n}.

  Function \code{onevarpow()} returns just the terms in which symbol
  \code{v} appears with power \code{n}.
  
  Function \code{series} returns a power series expansion of powers of
  variable \code{v}.  The print method for \code{series} objects is
  sensitive to the value of  \code{getOption("mvp_mult_symbol")}; set
  this to \code{"*"} to get \code{mpoly}-compatible output.

  Functions \code{mvp_taylor_onevar()}, \code{mvp_taylor_allvars()} and
  \code{mvp_to_series()} are low-level helper functions that are not
  intended for the user.

}
\author{Robin K. S. Hankin}
\seealso{\code{\link{deriv}}}
\examples{
taylor(as.mvp("1+x")^6,2)

taylor(as.mvp("1+x+y")^3,2)      # neglects all terms with total power>2
taylor(as.mvp("1+x+y")^3,2,"x")  # terms like y^3 are treated as constants

p <- horner("x+y",1:4)

onevarpow(p,2,"x")   # coefficient of x^2
onevarpow(p,3,"x")   # coefficient of x^3

series(rmvp(10),"a")

# Works well with pipes:

f <- function(n){as.mvp(sub('n',n,'1+x^n*y'))}
Reduce(`*`,lapply(1:6,f)) \%>\% series('y')
Reduce(`*`,lapply(1:6,f)) \%>\% series('x')


p \%>\% taylor(2)
p \%>\% taylor(2,"x")
(p \%>\% subs(x="x+dx") -p) \%>\% taylor(2,"dx")


## Third order taylor expansion of f(x)=sin(x+y) for x=1.1, about x=1:
sinxpy <- horner("x+y",c(0,1,0,-1/6,0,+1/120,0,-1/5040,0,1/362880))  # sin(x+y)
dx <- as.mvp("dx")
t3 <- sinxpy  + aderiv(sinxpy,x=1)*dx + aderiv(sinxpy,x=2)*dx^2/2 + aderiv(sinxpy,x=3)*dx^3/6
t3 \%<>\% subs(x=1,dx=0.1)  # t3 = Taylor expansion of sin(y+1.1)
t3 \%>\% subs(y=0.3)  - sin(1.4)  # numeric; should be small
}
\keyword{symbolmath}
