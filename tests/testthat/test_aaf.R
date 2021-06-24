# test coeffs stuff

test_that("Test suite test_aaf.R",{


    foo <- function(a,b){
        ca <- coeffs(a)
        cb <- coeffs(b)

        print(ca)
        
        expect_silent(!ca)
        expect_silent(!cb)

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

        expect_true(is.disord(coeffs(a)))
        expect_false(is.disord(a))
        expect_true(consistent(coeffs(a),coeffs(a)))
        expect_true(consistent(coeffs(a),2*coeffs(a)))
        expect_true(consistent(coeffs(a),coeffs(a)*2))
        expect_true(consistent(coeffs(a),coeffs(a)+5))
        expect_false(consistent(coeffs(a),coeffs(a+5)))
        expect_silent(coeffs(a)>0 & coeffs(a)>0)
        expect_silent(coeffs(a)>0 | coeffs(a)>0)

        b <- a*7
        expect_silent(coeffs(a)>0 & coeffs(b)>0)
        expect_silent(coeffs(a)>0 | coeffs(b)>0)



        expect_silent(as.function(a)(a=3))

        expect_silent({jj <- a ; coeffs(jj) <- coeffs(jj)+0})
        expect_silent({jj <- a ; coeffs(jj) <- coeffs(jj)*1})
        expect_error (coeffs(a) <- coeffs(b))
        expect_error (coeffs(a) <- coeffs(a+1))

        expect_silent({jj <- a ; coeffs(jj) <- 3})


        expect_true(coeffs(a) %~% coeffs(a))
        expect_true(coeffs(a) %~% (4+coeffs(a)))

        expect_error(coeffs(a)[1])
        expect_error(coeffs(a)[1] <- 0)
        expect_error(coeffs(a) <- coeffs(a^2))
        expect_silent({jj <- a ; coeffs(jj) <- coeffs(jj)%%7})
        
        expect_error(coeffs(a)[2] <- coeffs(a^2))
        expect_error(coeffs(a)[1:2] <- 1:2)
        expect_error(coeffs(a)[2] <- coeffs(a^2)[2])

        expect_error(coeffs(a)[1,2])
        expect_error(coeffs(a)[1,2] <- 4)
        expect_silent({jj <- a ; coeffs(jj)[coeffs(jj) < 2] <- 2})
        expect_error(coeffs(a)[coeffs(a) < 2,1] <- 2)

        
    } # function foo() closes

    for(i in 1:5){
        x <- 4 + rmvp(6)
        y <- 5 + rmvp(6)
        foo(x,y)
    }

    expect_error(kahle(symbols=letters[1:2]))
    expect_true(horner("x",1:4) == as.mvp("1 + 2 x + 3 x^2 + 4 x^3"))
    expect_true(trunc(horner("x+y",1:4),1) == as.mvp("1 + 2 x + 2 y"))
    expect_true(trunc1(as.mvp("1+x+y^2")^4,x=1,y=2) == as.mvp("1+4 x + 12 x y^2 + 4 y^2"))


    P <- horner("x+y^3 + x*y",1:7)-1
    expect_true(is.constant(ooom(P,0)))
    expect_true(is.zero(ooom(P,0)-1))
    expect_true(is.zero(trunc(ooom(P,7)*(1-P)-1,7)))

    expect_true(is.constant(onevarpow(P,y=18)))
    expect_false(is.constant(onevarpow(P,y=0)))

    expect_output(print(series(P,"x")))
    
    expect_true(varchange(varchange(P,x="xux"),xux="x")==P)
    expect_true(varchange_formal(varchange_formal(P,"x","_"),"_","x") == P)

    expect_silent(taylor(P,"x","a"))
    expect_silent(taylor(P,"x","a",debug=TRUE))
    expect_true(nterms(P)==73)
    expect_output(print(summary(P)))
    expect_silent(rtypical(P))
    expect_error(P&P)
    expect_error(!P)

})

