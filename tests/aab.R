library("skimpy")


# 1+3a+7a^2*b + 9abc:
allnames <- list(
    c("a"),
    c("a"),
    c("a","b"),
    letters[1:3]
)


allpowers <- list(
    0,
    1,
    c(2,1),
    c(1,1,1)
    )

coeffs = c(1,3,7,9)


out1 <- simplify(allnames=allnames,allpowers=allpowers,coefficients=coeffs)
 
