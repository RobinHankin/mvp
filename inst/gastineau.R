## Following example taken from M. Gastineau, who considers p*(p+1) /. {p -> (1+x+y+z+t)^16


library(skimpy)

f <- as.mvp("p+p^2")
u <- as.mvp("1+x+y+z+t")
u16 <- u^16

system.time(ignore <- subsmvp(f,"p",u16))  # about 30 seconds on my mac




## Compare spray, which is faster than the fastest of Gastineau:
p <- (1+spray(diag(4)))^16
system.time(ignore <- p*(p+1))
