# tests to increase coverage


test_that("Test suite test_aag.R",{


    expect_output(print(as.mvp("1+x+X + 5*y")))
    expect_output(print(0*as.mvp("1+x+X + 5*y")))
    expect_silent(as.mvp(structure(list(c(x = 7, coef = 30)), class = "mpoly")))
    expect_silent(as.mvp(structure(list(index = structure(c(0L, 1L, 1L, 2L, 1L, 2L, 2L, 2L, 0L), .Dim = c(3L, 3L)), value = c(1, 1, 1)), class = "spray")))
    expect_silent(as.mvp(list(names=list(c('x'),c('x','y')),powers=list(1,1:2),coeffs=1:2)))
    expect_silent(as.mvp(structure(list(indices = list(1:2, c(1L, 3L, 3L, 3L), c(2L, 3L, 3L, 2L), 3L, c(3L, 3L, 2L, 1L)), coeffs = c(1, 9, 3, 13, 2)), class = "freealg")))
    expect_error(as.mvp(function(x){x^6}))

    library("spray") # needed for mvp_to_spray()
    expect_silent(mvp_to_spray(as.mvp("x+x*y")))
    expect_silent(mvp_to_spray(as.mvp("1+x+x*y")))


    expect_true(is.constant(as.mvp("1")))
    expect_false(is.constant(as.mvp("1+x")))

    expect_true(subs(as.mvp("1+x+y"),x=2,y=5,lose=TRUE) == 8)
    expect_error(subs(as.mvp("1+x+y"),x=2,y=5,lose=FALSE) == 8)
    expect_true(subs(as.mvp("1+x+y"),x=2,y=5,lose=FALSE) == as.mvp(8))

    expect_true (subsy(as.mvp("1+x"),x=1,lose=TRUE )==2)
    expect_error(subsy(as.mvp("1+x"),x=1,lose=FALSE)==2)
    expect_true (subsy(as.mvp("1+x"),x=1,lose=FALSE)==as.mvp(2))

    
    
})