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

        expect_true(is.coeffs(coeffs(a)))
        expect_false(is.coeffs(a))
        expect_true(consistent(coeffs(a),coeffs(a)))
        expect_true(consistent(coeffs(a),2*coeffs(a)))
        expect_true(consistent(coeffs(a),coeffs(a)*2))
        expect_true(consistent(coeffs(a),coeffs(a)+5))
        expect_false(consistent(coeffs(a),coeffs(a+5)))

        expect_true(coeffs(a) %~% coeffs(a))
        expect_true(coeffs(a) %~% (4+coeffs(a)))

        expect_error(coeffs(a)[1])
        expect_error(coeffs(a)[1] <- 0)
        expect_error(coeffs(a) <- coeffs(a^2))
        expect_silent(coeffs(a) <- coeffs(a)%%100)
        


    } # function foo() closes

    for(i in 1:5){
        x <- 4 + rmvp(6)
        y <- 5 + rmvp(6)
        foo(x,y)
    }

})
