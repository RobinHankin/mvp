library("mvp")


# 1+3a+7a^2*b + 9abc:
allnames <- list(
    c("a"),
    c("a"),
    c("bung","b"),
    letters[1:3]
)

allpowers <- list(
    3,
    1,
    c(2,1),
    c(1,1,1)
    ) 

coeffs = c(1,3,7,9)

a <- mvp(vars=allnames,powers=allpowers,coeffs=coeffs)
 


jj <- list(
       c(x = 1, coef = 1, y = 0),
       c(x = 0, y = 1, coef = 2),  
       c(y = 1, coef = -6),  
       c(z = 1, coef = -3, x = 2),  
       c(x = 1, coef = 0, x = 3),
       c(t = 1, coef = 4, t = 2, y = 4),
       c(x = 1000,coef=777),  # 777 x^1000
       c(x = 1),  # x
       c(coef = 5),
       c(coef = 5),
       c(coef = -5)
     )
     
mj <-     mpoly(jj)
