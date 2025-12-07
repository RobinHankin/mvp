# Low level functions

Various low-level functions that call the C routines

## Usage

``` r
mvp_substitute(allnames,allpowers,coefficients,v,values)
mvp_substitute_mvp(allnames1, allpowers1, coefficients1, allnames2, allpowers2, 
    coefficients2, v)
mvp_vectorised_substitute(allnames, allpowers, coefficients, M, nrows, ncols, v)
mvp_prod(allnames1,allpowers1,coefficients1,allnames2,allpowers2,coefficients2)
mvp_add(allnames1, allpowers1, coefficients1, allnames2, allpowers2,coefficients2)
simplify(allnames,allpowers,coefficients)
mvp_deriv(allnames, allpowers, coefficients, v)
mvp_power(allnames, allpowers, coefficients, n)
```

## Arguments

- allnames,allpowers,coefficients,allnames1,allpowers1,coefficients1,
  allnames2,allpowers2,coefficients2,v,values,n,M,nrows,ncols:

  Variables sent to the C routines

## Details

These functions call the functions defined in `RcppExports.R`

## Author

Robin K. S. Hankin

## Note

These functions are not intended for the end-user. Use the syntactic
sugar (as in `a+b` or `a*b` or `a^n`), or functions like
[`mvp_plus_mvp()`](https://robinhankin.github.io/mvp/reference/Ops.mvp.md),
which are more user-friendly.
