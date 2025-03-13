# Some spot checks, mostly as explicit tests of the new C++-17 idiom


test_that("Test suite test_aah.R",{

expect_true(as.mvp("1+x") == as.mvp("x+1"))
expect_true(as.mvp("y+x") == as.mvp("x+y"))


expect_true(as.mvp("x+y") * as.mvp("x-y") == as.mvp("x^2 - y^2"))
expect_true(as.mvp("1+x") * as.mvp("1-y") == as.mvp("1 + x - y - x*y"))
expect_true(as.mvp("1+x") * as.mvp("3-y") == as.mvp("3 + 3*x - y - x*y"))

expect_true(deriv(as.mvp("1 + x*y + x^5 + y^56"), "x") == as.mvp("y + 5*x^4"))


expect_true(trunc1(as.mvp("1 + x*y + x^5 + y^56"), x=1) == as.mvp("1 + x*y + y^56"))
expect_true(trunc(as.mvp("1+x+y^2")^3,2) == as.mvp("1 + 3 x + 3 x^2 + 3 y^2"))
expect_true(onevarpow(as.mvp("1+x+x*y^2  + z*y^2*x"),x=1,y=2) == as.mvp("1+z"))

expect_true(
    subs(as.mvp("5 + a + 5 b + 11 b c + c"), a = "1+b x^3", b = "1-y") ==
    as.mvp("11 + 12 c - 11 c y + x^3 - x^3 y - 5 y")
)

expect_true(subs(as.mvp("1 + x + x^2 + y"),x=3) == as.mvp("13+y"))

expect_true(as.mvp("1+x")^3 == as.mvp("1 + 3*x + 3*x^2 + x^3"))
expect_true(as.mvp("1+x")^4 == as.mvp("1 + 4*x + 6*x^2 + 4*x^3 + x^4"))

power_test_lowlevel <- function(p=as.mvp("1+x"),n){
    jj <- mvp_power(allnames=p[[1]],allpowers=p[[2]],coefficients=p[[3]],n=n)
    return(mvp(jj[[1]],jj[[2]],jj[[3]]))
}

expect_error(power_test_lowlevel(n= -1))
expect_true(power_test_lowlevel(n=0) == as.mvp("1"))
expect_true(power_test_lowlevel(n=1) == as.mvp("1+x"))
expect_true(power_test_lowlevel(n=2) == as.mvp("1+2*x+x^2"))

})
