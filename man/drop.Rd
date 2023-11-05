\name{drop}
\alias{drop}
\alias{lose}
\alias{lose.mvp}
\alias{drop,mvp-method}
\alias{drop_mvp}
\title{Drop empty variables}
\description{

Convert an \code{mvp} object which is a pure constant into a scalar
whose value is the coefficient of the empty term.

A few functions in the package (currently \code{subs()},
\code{subsy()}) take a \code{drop} argument that behaves much like the
\code{drop} argument in base extraction.

Function \code{drop()} is an \proglang{S4} generic, which is why the
package calls \code{setOldClass()}.

\code{drop()} was formerly called \code{lose()}.

}
\usage{
\S4method{drop}{mvp}(x)
}
\arguments{
  \item{x}{Object of class \code{mvp}}
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{subs}}}
\examples{

(m1 <- as.mvp("1+bish +bash^2 + bosh^3"))
(m2 <- as.mvp("bish +bash^2 + bosh^3"))

m1-m2         # an mvp object
drop(m1-m2)   # numeric



}