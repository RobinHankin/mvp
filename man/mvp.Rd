\name{mvp}
\alias{mvp}
\alias{mvp-class}
\alias{is.mvp}
\alias{as.mvp}
\alias{as.mvp.character}
\alias{as.mvp.list}
\alias{as.mvp.mvp}
\alias{as.mvp.numeric}
\alias{as.mvp.mpoly}
\alias{is_ok_mvp}
\title{Multivariate polynomials, mvp objects}
\description{Create, test for, and coerce to, \code{mvp} objects}
\usage{
mvp(vars, powers, coeffs)
is_ok_mvp(vars,powers,coeffs)
is.mvp(x)
as.mvp(x)
\S3method{as.mvp}{character}(x)
\S3method{as.mvp}{list}(x)
\S3method{as.mvp}{mpoly}(x)
\S3method{as.mvp}{mvp}(x)
\S3method{as.mvp}{numeric}(x)
}
\arguments{
  \item{vars}{List of variables comprising each term of an \code{mvp} object}
  \item{powers}{List of powers corresponding to the variables of the
    \code{vars} argument}
  \item{coeffs}{Numeric vector corresponding to the coefficients to each
    element of the \code{var} and \code{powers} lists}
  \item{x}{Object to be coerced to or tested for being class \code{mvp}}
}
\details{
Function \code{mvp()} is the formal creation mechanism for \code{mvp}
objects.  However, it is not very user-friendly; it is better to use
\code{as.mvp()} in day-to-day use.

Function \code{is_ok_mvp()} checks for consistency of its arguments.

}
\author{Robin K. S. Hankin}
\examples{

mvp(list("x", c("x","y"), "a", c("y","x")), list(1,1:2,3,c(-1,4)), 1:4)

## Note how the terms appear in an arbitrary order, as do
## the symbols within a term.

kahle  <- mvp(
    vars   = split(cbind(letters,letters[c(26,1:25)]),rep(seq_len(26),each=2)),
    powers = rep(list(1:2),26),
    coeffs = 1:26
)
kahle
## again note arbitrary order of terms and symbols within a term

## Standard arithmetic rules apply:

a <- as.mvp("1 + 4*x*y + 7*z")
b <- as.mvp("-7*z + 3*x^34 - 2*z*x")

a+b
a*b^2

(a+b)*(a-b) == a^2-b^2 # should be TRUE


## variable "xy" is distinct from "x*y":

as.mvp("x + y + xy")^2
as.mvp(paste(state.name[1:5],collapse="+"))^2


}
