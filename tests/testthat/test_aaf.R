# test coeffs stuff

test_that("Test suite test_aaf.R",{


    foo <- function(a,b){
        ca <- coeffs(a)
        cb <- coeffs(b)

        print(ca)
        
        expect_error(!ca)
        expect_error(!cb)

        expect_silent(+ca)
        expect_silent(-ca)
        expect_silent(ca +  ca)
        expect_silent(ca -  ca)
        expect_silent(ca *  ca)
        expect_silent(ca /  ca)
        expect_silent(ca ^  ca)
        expect_silent(ca %% ca)
        expect_silent(ca == ca)
        expect_silent(ca != ca)

        expect_error(ca +  cb)
        expect_error(ca -  cb)
        expect_error(ca *  cb)
        expect_error(ca /  cb)
        expect_error(ca ^  cb)
        expect_error(ca %% cb)
        expect_error(ca == cb)
        expect_error(ca != cb)

        expect_silent(ca +  1)
        expect_silent(ca -  1)
        expect_silent(ca *  1)
        expect_silent(ca /  1)
        expect_silent(ca ^  1)
        expect_silent(ca %% 1)
        expect_silent(ca == 2)
        expect_silent(ca != 2)
        expect_silent(ca >= 2)
        expect_silent(ca <= 2)
        expect_silent(ca >  2)
        expect_silent(ca <  2)

        expect_silent(2 +  ca)
        expect_silent(2 -  ca)
        expect_silent(2 *  ca)
        expect_silent(2 /  ca)
        expect_silent(2 ^  ca)
        expect_silent(2 %% ca)
        expect_silent(2 == ca)
        expect_silent(2 != ca)
        expect_silent(2 >= ca)
        expect_silent(2 <= ca)
        expect_silent(2 >  ca)
        expect_silent(2 <  ca)

        expect_silent(coeffs(a) <- coeffs(a)+0)
        expect_silent(coeffs(a) <- coeffs(a)*1)
        expect_error (coeffs(a) <- coeffs(b))
        expect_error (coeffs(a) <- coeffs(a+1))

        expect_silent(coeffs(a) <- 3)

    } # function foo() closes

    for(i in 1:5){
        x <- 4 + rmvp(6)
        y <- 5 + rmvp(6)
        foo(x,y)
    }

})
