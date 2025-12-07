# Fast Symbolic Multivariate Polynomials

Fast manipulation of symbolic multivariate polynomials using the 'Map'
class of the Standard Template Library. The package uses print and
coercion methods from the 'mpoly' package but offers speed improvements.
It is comparable in speed to the 'spray' package for sparse arrays, but
retains the symbolic benefits of 'mpoly'. To cite the package in
publications, use Hankin 2022 \<doi:10.48550/ARXIV.2210.15991\>. Uses
'disordR' discipline.

## Details

The DESCRIPTION file: This package was not yet installed at build
time.  
Index: This package was not yet installed at build time.  

## Author

Robin K. S. Hankin \[aut, cre\] (ORCID:
\<https://orcid.org/0000-0001-5982-0415\>)

Maintainer: Robin K. S. Hankin \<hankin.robin@gmail.com\>

## Examples

``` r
(p <- as.mvp("1+x+x*y+x^5"))
#> mvp object algebraically equal to
#> 1 + x + x y + x^5

p + as.mvp("a+b^6")
#> mvp object algebraically equal to
#> 1 + a + b^6 + x + x y + x^5

p^3
#> mvp object algebraically equal to
#> 1 + 3 x + 3 x y + 3 x^2 + 6 x^2 y + 3 x^2 y^2 + x^3 + 3 x^3 y + 3 x^3 y^2 + x^3
#> y^3 + 3 x^5 + 6 x^6 + 6 x^6 y + 3 x^7 + 6 x^7 y + 3 x^7 y^2 + 3 x^10 + 3 x^11 +
#> 3 x^11 y + x^15

subs(p^4,x="a+b^2")
#> mvp object algebraically equal to
#> 1 + 4 a + 12 a b^2 + 24 a b^2 y + 12 a b^2 y^2 + 12 a b^4 + 36 a b^4 y + 36 a
#> b^4 y^2 + 12 a b^4 y^3 + 4 a b^6 + 16 a b^6 y + 24 a b^6 y^2 + 16 a b^6 y^3 + 4
#> a b^6 y^4 + 20 a b^8 + 72 a b^10 + 72 a b^10 y + 84 a b^12 + 168 a b^12 y + 84
#> a b^12 y^2 + 32 a b^14 + 96 a b^14 y + 96 a b^14 y^2 + 32 a b^14 y^3 + 60 a
#> b^18 + 132 a b^20 + 132 a b^20 y + 72 a b^22 + 144 a b^22 y + 72 a b^22 y^2 +
#> 60 a b^28 + 64 a b^30 + 64 a b^30 y + 20 a b^38 + 4 a y + 6 a^2 + 12 a^2 b^2 +
#> 36 a^2 b^2 y + 36 a^2 b^2 y^2 + 12 a^2 b^2 y^3 + 6 a^2 b^4 + 24 a^2 b^4 y + 36
#> a^2 b^4 y^2 + 24 a^2 b^4 y^3 + 6 a^2 b^4 y^4 + 40 a^2 b^6 + 180 a^2 b^8 + 180
#> a^2 b^8 y + 252 a^2 b^10 + 504 a^2 b^10 y + 252 a^2 b^10 y^2 + 112 a^2 b^12 +
#> 336 a^2 b^12 y + 336 a^2 b^12 y^2 + 112 a^2 b^12 y^3 + 270 a^2 b^16 + 660 a^2
#> b^18 + 660 a^2 b^18 y + 396 a^2 b^20 + 792 a^2 b^20 y + 396 a^2 b^20 y^2 + 420
#> a^2 b^26 + 480 a^2 b^28 + 480 a^2 b^28 y + 190 a^2 b^36 + 12 a^2 y + 6 a^2 y^2
#> + 4 a^3 + 4 a^3 b^2 + 16 a^3 b^2 y + 24 a^3 b^2 y^2 + 16 a^3 b^2 y^3 + 4 a^3
#> b^2 y^4 + 40 a^3 b^4 + 240 a^3 b^6 + 240 a^3 b^6 y + 420 a^3 b^8 + 840 a^3 b^8
#> y + 420 a^3 b^8 y^2 + 224 a^3 b^10 + 672 a^3 b^10 y + 672 a^3 b^10 y^2 + 224
#> a^3 b^10 y^3 + 720 a^3 b^14 + 1980 a^3 b^16 + 1980 a^3 b^16 y + 1320 a^3 b^18 +
#> 2640 a^3 b^18 y + 1320 a^3 b^18 y^2 + 1820 a^3 b^24 + 2240 a^3 b^26 + 2240 a^3
#> b^26 y + 1140 a^3 b^34 + 12 a^3 y + 12 a^3 y^2 + 4 a^3 y^3 + a^4 + 20 a^4 b^2 +
#> 180 a^4 b^4 + 180 a^4 b^4 y + 420 a^4 b^6 + 840 a^4 b^6 y + 420 a^4 b^6 y^2 +
#> 280 a^4 b^8 + 840 a^4 b^8 y + 840 a^4 b^8 y^2 + 280 a^4 b^8 y^3 + 1260 a^4 b^12
#> + 3960 a^4 b^14 + 3960 a^4 b^14 y + 2970 a^4 b^16 + 5940 a^4 b^16 y + 2970 a^4
#> b^16 y^2 + 5460 a^4 b^22 + 7280 a^4 b^24 + 7280 a^4 b^24 y + 4845 a^4 b^32 + 4
#> a^4 y + 6 a^4 y^2 + 4 a^4 y^3 + a^4 y^4 + 4 a^5 + 72 a^5 b^2 + 72 a^5 b^2 y +
#> 252 a^5 b^4 + 504 a^5 b^4 y + 252 a^5 b^4 y^2 + 224 a^5 b^6 + 672 a^5 b^6 y +
#> 672 a^5 b^6 y^2 + 224 a^5 b^6 y^3 + 1512 a^5 b^10 + 5544 a^5 b^12 + 5544 a^5
#> b^12 y + 4752 a^5 b^14 + 9504 a^5 b^14 y + 4752 a^5 b^14 y^2 + 12012 a^5 b^20 +
#> 17472 a^5 b^22 + 17472 a^5 b^22 y + 15504 a^5 b^30 + 12 a^6 + 84 a^6 b^2 + 168
#> a^6 b^2 y + 84 a^6 b^2 y^2 + 112 a^6 b^4 + 336 a^6 b^4 y + 336 a^6 b^4 y^2 +
#> 112 a^6 b^4 y^3 + 1260 a^6 b^8 + 5544 a^6 b^10 + 5544 a^6 b^10 y + 5544 a^6
#> b^12 + 11088 a^6 b^12 y + 5544 a^6 b^12 y^2 + 20020 a^6 b^18 + 32032 a^6 b^20 +
#> 32032 a^6 b^20 y + 38760 a^6 b^28 + 12 a^6 y + 12 a^7 + 32 a^7 b^2 + 96 a^7 b^2
#> y + 96 a^7 b^2 y^2 + 32 a^7 b^2 y^3 + 720 a^7 b^6 + 3960 a^7 b^8 + 3960 a^7 b^8
#> y + 4752 a^7 b^10 + 9504 a^7 b^10 y + 4752 a^7 b^10 y^2 + 25740 a^7 b^16 +
#> 45760 a^7 b^18 + 45760 a^7 b^18 y + 77520 a^7 b^26 + 24 a^7 y + 12 a^7 y^2 + 4
#> a^8 + 270 a^8 b^4 + 1980 a^8 b^6 + 1980 a^8 b^6 y + 2970 a^8 b^8 + 5940 a^8 b^8
#> y + 2970 a^8 b^8 y^2 + 25740 a^8 b^14 + 51480 a^8 b^16 + 51480 a^8 b^16 y +
#> 125970 a^8 b^24 + 12 a^8 y + 12 a^8 y^2 + 4 a^8 y^3 + 60 a^9 b^2 + 660 a^9 b^4
#> + 660 a^9 b^4 y + 1320 a^9 b^6 + 2640 a^9 b^6 y + 1320 a^9 b^6 y^2 + 20020 a^9
#> b^12 + 45760 a^9 b^14 + 45760 a^9 b^14 y + 167960 a^9 b^22 + 6 a^10 + 132 a^10
#> b^2 + 132 a^10 b^2 y + 396 a^10 b^4 + 792 a^10 b^4 y + 396 a^10 b^4 y^2 + 12012
#> a^10 b^10 + 32032 a^10 b^12 + 32032 a^10 b^12 y + 184756 a^10 b^20 + 12 a^11 +
#> 72 a^11 b^2 + 144 a^11 b^2 y + 72 a^11 b^2 y^2 + 5460 a^11 b^8 + 17472 a^11
#> b^10 + 17472 a^11 b^10 y + 167960 a^11 b^18 + 12 a^11 y + 6 a^12 + 1820 a^12
#> b^6 + 7280 a^12 b^8 + 7280 a^12 b^8 y + 125970 a^12 b^16 + 12 a^12 y + 6 a^12
#> y^2 + 420 a^13 b^4 + 2240 a^13 b^6 + 2240 a^13 b^6 y + 77520 a^13 b^14 + 60
#> a^14 b^2 + 480 a^14 b^4 + 480 a^14 b^4 y + 38760 a^14 b^12 + 4 a^15 + 64 a^15
#> b^2 + 64 a^15 b^2 y + 15504 a^15 b^10 + 4 a^16 + 4845 a^16 b^8 + 4 a^16 y +
#> 1140 a^17 b^6 + 190 a^18 b^4 + 20 a^19 b^2 + a^20 + 4 b^2 + 4 b^2 y + 6 b^4 +
#> 12 b^4 y + 6 b^4 y^2 + 4 b^6 + 12 b^6 y + 12 b^6 y^2 + 4 b^6 y^3 + b^8 + 4 b^8
#> y + 6 b^8 y^2 + 4 b^8 y^3 + b^8 y^4 + 4 b^10 + 12 b^12 + 12 b^12 y + 12 b^14 +
#> 24 b^14 y + 12 b^14 y^2 + 4 b^16 + 12 b^16 y + 12 b^16 y^2 + 4 b^16 y^3 + 6
#> b^20 + 12 b^22 + 12 b^22 y + 6 b^24 + 12 b^24 y + 6 b^24 y^2 + 4 b^30 + 4 b^32
#> + 4 b^32 y + b^40
aderiv(p^2,x=4)
#> mvp object algebraically equal to
#> 240 x + 720 x^2 + 720 x^2 y + 5040 x^6
horner(p,1:3)
#> mvp object algebraically equal to
#> 6 + 8 x + 8 x y + 3 x^2 + 6 x^2 y + 3 x^2 y^2 + 8 x^5 + 6 x^6 + 6 x^6 y + 3
#> x^10
```
