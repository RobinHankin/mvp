\name{horner}
\alias{horner}
\title{Horner's method}
\description{Horner's method for multivariate polynomials}
\usage{
horner(P,v)
}
\arguments{
  \item{P}{Multivariate polynomial}
  \item{v}{Numeric vector of coefficients}
}
\details{

  Given a polynomial

  \deqn{p(x) = a_0 +a_1+a_2x^2+\cdots + a_nx^n}{omitted; see PDF}

  it is possible to express \eqn{p(x)} in the algebraically equivalent
  form

  \deqn{p(x) = a_0 + x\left(a_1+x\left(a_2+\cdots + x\left(a_{n-1} +xa_n
\right)\cdots\right)\right)}{omitted; see PDF}

which is much more efficient for evaluation, as it requires only \eqn{n}
multiplications and \eqn{n} additions, and this is optimal.  But this is
not implemented here because it's efficient.  It is implemented because
it works if \eqn{x} is itself a (multivariate) polynomial, and that is
the second coolest thing ever.  The coolest thing ever is the
\code{Reduce()} function.

}
  
\author{Robin K. S. Hankin}
\seealso{\code{\link{ooom}}}
\examples{
horner("x",1:5)
horner("x+y",1:3)

w <- as.mvp("x+y^2")
stopifnot(1 + 2*w + 3*w^2 == horner(w,1:3))  # note off-by-one issue

"x+y+x*y" |> horner(1:3) |> horner(1:2)
}


\keyword{symbolmath}
