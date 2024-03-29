# tests to increase coverage


test_that("Test suite test_aag.R",{


    expect_output(print(as.mvp("1+x+X + 5*y")))
    expect_output(print(0*as.mvp("1+x+X + 5*y")))
    expect_silent(as.mvp(structure(list(c(x = 7, coef = 30)), class = "mpoly")))
    expect_silent(as.mvp(list(names=list(c('x'),c('x','y')),powers=list(1,1:2),coeffs=1:2)))
    expect_error(as.mvp(function(x){x^6}))



    expect_true(is.constant(as.mvp("1")))
    expect_false(is.constant(as.mvp("1+x")))

    expect_true(subs(as.mvp("1+x+y"),x=2,y=5,drop=TRUE) == 8)
    expect_error(subs(as.mvp("1+x+y"),x=2,y=5,drop=FALSE) == 8)
    expect_true(subs(as.mvp("1+x+y"),x=2,y=5,drop=FALSE) == as.mvp(8))

    expect_true (subsy(as.mvp("1+x"),x=1,drop=TRUE )==2)
    expect_error(subsy(as.mvp("1+x"),x=1,drop=FALSE)==2)
    expect_true (subsy(as.mvp("1+x"),x=1,drop=FALSE)==as.mvp(2))



    M <- matrix(sample(1:3,26*3,replace=TRUE),ncol=26)
    rownames(M) <- c("Huey", "Dewie", "Louie")
    expect_error(subvec(kahle(r=3,p=1:3),M)) # no colnames
    colnames(M) <- letters
    expect_silent(subvec(kahle(r=3,p=1:3),M)) 

    if(FALSE){  # the spray library interacts badly with the mvp
                # library [subs() is not generic, for example, and
                # this can cause problems if the wrong version is
                # called].  Do not load mvp and spray simultaneously,
                # pending S4 further investigation.

      library("spray") # needed for mvp_to_spray()
      expect_silent(mvp_to_spray(as.mvp("x+x*y")))
      expect_silent(mvp_to_spray(as.mvp("1+x+x*y")))
      }
      
P <- horner("a+b",1:9)
expect_error(coeffs(P)[coeffs(a)<3] + coeffs(a)[coeffs(a)>500])

P <- as.mvp("-7*z + 3*x^34 - 2*z*x + 7*x*z*u + 1*x*y^5")
expect_true(P[coeffs(P) < 3] ==  as.mvp("-7*z - 2*z*x + 1*x*y^5"))
P[coeffs(P) < 3] <- 99
expect_true(P == as.mvp("7 u x z + 99 x y^5 + 99 x z + 3 x^34 + 99 z"))
expect_error(P[coeffs(P)==99] <- 1:3)


})
