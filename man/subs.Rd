\name{subs}
\alias{subs}
\alias{subsy}
\alias{subvec}
\alias{substitute}
\alias{subsmvp}
\alias{subs_mvp}
\alias{mvp_subs_mvp}
\alias{varchange}
\alias{varchange_formal}
\alias{namechanger}
\title{Substitution}
\description{Substitute symbols in an \code{mvp} object for numbers or other
  multivariate polynomials
}
\usage{
subs(S, ..., lose = TRUE)
subsy(S, ..., lose = TRUE)
subvec(S, ...)
subsmvp(S,v,X)
varchange(S,...)
varchange_formal(S,old,new)
namechanger(x,old,new)
}
\arguments{
  \item{S,X}{Multivariate polynomials}
  \item{\dots}{named arguments corresponding to variables to substitute}
  \item{lose}{Boolean with default \code{TRUE} meaning to return a
    scalar (the constant) in place of a constant \code{mvp} object}
  \item{v}{A string corresponding to the variable to substitute}
  \item{old,new,x}{The old and new variable names respectively; \code{x}
  is a character vector} 
}
\value{
  Returns a multivariate polynomial, object of class \code{mvp}, or a
  numeric vector (\code{subvec()}).
}
\details{

Function \code{subs()} substitutes variables for \code{mvp} objects,
using a natural R idiom.  Observe that this type of substitution is
sensitive to order:

\preformatted{
> p <- as.mvp("a b^2")
> subs(p,a="b",b="x")
mvp object algebraically equal to
x^3
> subs(p,b="x",a="b")  # same arguments, different order
mvp object algebraically equal to
b x^2
}

Functions \code{subsy()} and \code{subsmpv()} are lower-level functions,
not really intended for the end-user.  Function \code{subsy()}
substitutes variables for numeric values (order matters if a variable is
substitued more than once).  Function \code{subsmpv()} takes a \code{mvp}
object and substitutes another \code{mvp} object for a specific symbol.

Function \code{subvec()} substitutes the symbols of \code{S} with
numerical values.  It is vectorised in its ellipsis arguments with
recycling rules and names behaviour inherited from \code{cbind()}.
However, if the first element of \code{...} is a matrix, then this is
interpreted by rows, with symbol names given by the matrix column names;
further arguments are ignored.  Unlike \code{subs()}, this function is
generally only useful if all symbols are given a value; unassigned
symbols take a value of zero.

Function \code{varchange()} makes a \emph{formal} variable substitution.
It is useful because it can take non-standard variable names such as
\dQuote{\code{(a-b)}} or \dQuote{\code{?}}, and is used in
\code{taylor()}.  Function \code{varchange_formal()} does the same task,
but takes two character vectors, \code{old} and \code{new}, which might
be more convenient than passing named arguments.  Remember that
non-standard names might need to be quoted; also you might need to
escape some characters, see the examples).  Function
\code{namechanger()} is a low-level helper function that uses regular
expression idiom to substitute variable names.

}
\author{Robin K. S. Hankin}
\seealso{\code{\link{lose}}}
\examples{
p <- rmvp(6,2,2,letters[1:3])
p
subs(p,a=1)
subs(p,a=1,b=2)

subs(p,a="1+b x^3",b="1-y")
subs(p,a=1,b=2,c=3,lose=FALSE)

do.call(subs,c(list(as.mvp("z")),rep(c(z="C+z^2"),5)))

subvec(p,a=1,b=2,c=1:5)   # supply a named list of vectors

M <- matrix(sample(1:3,26*3,replace=TRUE),ncol=26)
colnames(M) <- letters
rownames(M) <- c("Huey", "Dewie", "Louie")
subvec(kahle(r=3,p=1:3),M)  # supply a matrix

varchange(as.mvp("1+x+xy + x*y"),x="newx") # variable xy unchanged

kahle(5,3,1:3) \%>\% subs(a="a + delta")

pnew <- varchange(p,a="]")  # nonstandard variable names OK
p111 <- varchange_formal(p,"\\\]","a")

}
\keyword{symbolmath}
