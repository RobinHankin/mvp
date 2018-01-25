\name{cilleruelo}
\alias{cilleruelo}
\title{
A class of multiplicative magic squares due to Cilleruelo and Luca
}
\description{
Cilleruelo and Luca give a class of multiplicative magic squares whose
behaviour is interesting.
}
\usage{
cilleruelo(n, m)
}
\arguments{
  \item{n,m}{Arguments: usually integers}
}
\details{
  \deqn{
    \left(
    \begin{array}{cccc}
    (n+2)(m+0) & (n+3)(m+3) & (n+1)(m+2) & (n+0)(m+1)\\
    (n+1)(m+1) & (n+0)(m+2) & (n+2)(m+3) & (n+3)(m+0)\\
    (n+0)(m+3) & (n+1)(m+0) & (n+3)(m+1) & (n+2)(m+2)\\
    (n+3)(m+2) & (n+2)(m+1) & (n+0)(m+0) & (n+1)(m+3)
    \end{array}
    \right)
  }{a 4x4 array}
}

\value{
Returns a \eqn{4\times 4}{4x4} matrix.
}
\references{

  Javier Cilleruelo and Florian Luca 2010, \dQuote{On multiplicative
magic squares}, \emph{The Electronic Journal of Combinatorics} vol 17,
\#N8

}

\author{
Robin K. S. Hankin
}
\examples{
is.magic(cilleruelo(5,6))
is.magic(cilleruelo(5,6),func=prod)


f <- function(n){
  jj <-
    sapply(
           seq(from=5,len=n),
           function(i){cilleruelo(i,i-4)}
           )
  xM <- apply(jj,2,max)
  xm <- apply(jj,2,min)

  cbind(xM-xm , 5^(5/12)*xm^0.5 , 6*xm^0.5)
}
  
matplot(f(200),type='l',log='xy',xlab='n',ylab='')
legend(x="topleft",legend=c("xM-xm","5^(5/12).xm^(1/2)","6xm^(1/2)"),
       lty=1:3,col=1:3)



}
