# test homog(), linear(), xyz(), product()

test_that("Test suite test_aae.R",{


    foo <- function(n){  # n>2
        expect_silent(jj <- product(seq_len(n)))
        expect_silent(jj <- product(seq_len(n),letters[seq_len(n+1)]))
        expect_error (jj <- product(seq_len(n),letters[seq_len(n-1)]))
        
        expect_silent(jj <- homog(n))
        expect_error (jj <- homog(n,symbols=letters[seq_len(n-1)]))
        expect_silent(jj <- homog(n,n))

        expect_silent(jj <- linear(seq_len(n),n))
        expect_error (jj <- linear(seq_len(n),symbols=letters[seq_len(n-1)]))

        expect_silent(jj <- xyz(n))
        expect_error (jj <- xyz(n,symbols=letters[seq_len(n-1)]))

        expect_silent (jj <- knight(n))
        expect_silent (jj <- knight(n,can_stay_still = TRUE))
        expect_warning(jj <- knight(seq_len(n)))
    } # function foo() closes

        foo(4)
})
