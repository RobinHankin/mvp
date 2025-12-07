# Random multivariate polynomials

Random multivariate polynomials, intended as quick “get you going”
examples of `mvp` objects

## Usage

``` r
rhmvp(n=7,size=4,pow=6,symbols=6)
rmvp(n=7,size=4,pow=6,symbols=6)
rmvpp(n=30,size=9,pow=20,symbols=15)
rmvppp(n=100,size=15,pow=99,symbols)
```

## Arguments

- n:

  Number of terms to generate

- size:

  Maximum number of symbols in each term

- pow:

  Maximum power of each symbol

- symbols:

  Symbols to use; if numeric, interpret as the first `symbols` letters
  of the alphabet

## Details

Function `rhmvp()` returns a random homogeneous `mvp`. Function `rmvp()`
returns a possibly nonhomogenous `mvp` and functions `rmvpp()` and
`rmvppp()` return, by default, progressively more complicated `mvp`
objects. Function `rmvppp()` returns a polynomial with multi-letter
variable names.

## Value

Returns a multivariate polynomial, an object of class `mvp`

## Author

Robin K. S. Hankin

## Examples

``` r
rhmvp()
#> mvp object algebraically equal to
#> 6 a b^2 c f^2 + 6 a^3 b^2 d + 5 b^2 c d^2 e + 7 b^2 d^3 e + 3 b^2 d^4 + 7 c d e
#> f^3 + 6 d^3 e f^2
rmvp()
#> mvp object algebraically equal to
#> 17 + 6 a e + 3 a^2 b^2 + 4 c e + 7 f
rmvpp()
#> mvp object algebraically equal to
#> 26 a d^2 i^2 j n o + 16 a h k^3 l^2 o + a h^5 k l^2 m o^2 + 17 a^2 e f^2 g h
#> j^2 m^3 o^4 + 15 a^2 f l + 14 a^3 b^2 e^3 f g^2 i^3 l^2 n^3 + 20 a^3 b^3 f^2 j
#> l n^2 o^3 + 2 a^3 d^2 e f^5 j^2 k^2 n + a^3 g^4 h^2 i j k^2 l n + 18 a^4 b c
#> f^4 j^4 k l^3 m^2 + 19 a^4 b c^2 i^2 j^4 m n + 3 b c e^2 f^3 h m^3 o + 9 b c^2
#> e^2 j k^6 n^2 o^3 + 22 b c^3 h^4 i^2 j l^5 n o + 17 b d^2 e^2 f^2 m o + 2 b e^2
#> f j k^2 l m^2 + 24 b^2 f^4 k m^4 + 4 b^3 c d e^3 f^2 i^3 k^3 m^3 + 12 b^3 f h k
#> o^4 + 9 b^4 d h i^6 j^4 k o^3 + 20 c g k^2 n + 19 c m o + 27 c^2 e^2 g h l^4 m
#> + 12 c^2 g j l m^2 o^2 + 10 d h + 27 d^2 e h i^4 j k l m o + 14 d^2 g i^2 l o^3
#> + 9 d^4 f^2 i m n^2 + 4 e g j + 17 e g k l n o
rmvppp()
#> mvp object algebraically equal to
#> 31 + 15 ar au bx cx^2 ev gs^3 gv^2 gz iv^2 iz + 57 ar au^6 av^5 bw^5 bx^3 dr^7
#> dz^9 fu^7 fw fy gz^3 hx^3 iv^2 ix^6 iy + 98 ar av aw^2 bv^2 bw bz fz gz^3 hs
#> hy^2 ir^2 iw^2 + 6 ar av cs dz ex^2 fz^2 gt hw iv^2 + 50 ar az^2 br^2 bw bx^4
#> cs er hw^4 hx^2 ir is^2 + 72 ar^2 at^6 br^6 bu^8 bz^8 cr^5 cz^7 dx^9 ev^10 fz^8
#> gx^2 hw^9 ir^4 it^3 iu^10 + 94 ar^2 au^3 aw^3 az^5 bz^3 dr^4 dx^7 er^5 fw^6
#> fy^3 gx^7 gy^7 ht^7 iv^5 iw^4 + 36 ar^3 as^6 bt^2 bx^4 dr^3 et^4 ew^2 gu^2 gy
#> gz^4 hw^4 iv^3 iw^3 ix + 62 ar^3 as^6 cr^5 cu^4 cw^3 ds^5 ew^5 ex^5 ez^6 fu^8
#> gu^4 ht^3 ir^8 iz^8 + 20 ar^3 av ay cy^3 dx^3 dy ew ey ft fw^2 gw^2 gx^2 ix + 3
#> ar^3 ax by^5 cx dt^3 dv^3 fr^3 fu fx gr^2 gs^2 gz^2 ir^4 it^7 iv + 46 ar^3 bz^2
#> cu dr^2 dy^5 ez^3 fs fv^2 fz gr^3 gu^3 gz hs^2 ir^4 iv^2 + 23 ar^3 cs ct^7 cu^4
#> cw^4 dv^5 dw dy^7 ew^2 ey^2 fs^2 ft^2 gr^6 gv^2 hy^5 + 46 ar^4 as^6 aw^6 az^4
#> dt^3 dx^8 ey^3 fs^7 fx^9 fy^10 fz^11 gv^5 hu^5 hv^4 ir^8 + 15 ar^4 bu^8 by^5
#> bz^9 eu^6 ey ez^2 fr^7 fs^5 fw^4 gs^2 gu^7 hs hv^5 iw^5 + 4 ar^5 ax^10 bs^8
#> bu^6 ct^6 dv^8 et^7 ey^3 ft^4 fw^6 gw^6 gy^10 ir^5 iw^5 ix^6 + 63 ar^5 bt^6
#> ds^3 du^4 dw^3 dy^2 es^6 ev^4 ey^5 ft^5 fx^6 gt^5 ht^4 hz iz^5 + 81 ar^6 as
#> ax^7 az br^5 cv^2 dt^3 fx^3 fy^4 hs^6 hw^5 hx^5 iu^6 iv^5 iz^2 + 98 ar^6 at^3
#> bt^8 bx^5 er^6 es^7 ey^8 fw^3 fy^3 gs^6 gw^4 gy^2 hr^2 ix^3 + 15 ar^6 ay^4 cw^6
#> cy^9 cz^8 ds^5 et^4 fr^9 gr^3 gy^6 hr^4 hu^4 hv^4 hx^5 hy^5 + 4 ar^6 bz^4 cu^3
#> cw^7 dv^7 ev^5 ey^7 fs^9 fy^7 fz^4 hr^6 hv^6 iu^12 iv^9 iz^5 + 2 ar^7 au aw^4
#> ct^11 cw^4 dv dw^7 fy^5 gu^3 gv^5 gy^5 hr^2 hu^4 iw^9 iy^2 + 66 ar^7 by^3 cs^7
#> cu^6 cx^6 dx^4 ex^5 ft^8 gs^4 gv^4 gw^9 ir^3 iu^6 iw^7 iy^5 + 55 ar^8 av^2 br^4
#> bv^3 ct^6 dr^2 dt^3 dy^4 ey^5 ft^5 gu gy^5 gz^4 hu^6 ix^5 + 18 ar^8 av^8 ax^3
#> bv^5 cr^8 cv^8 es^9 fx^6 fz gr^7 gv^3 hv^9 hx^4 hy^6 ir^5 + 4 as at^3 ay^4 az^2
#> cw dt^4 et^2 fu^4 gs hv^2 hw^2 hx iw^2 + 18 as au^6 aw^3 bs^7 bx^3 cs^3 cw^9
#> dw^5 ex^8 fw^6 gx^9 gy^9 hr^2 hs^6 iz^3 + 88 as^2 au^3 aw bs^2 bv^2 cr du^2
#> er^4 es^2 fv gt^4 gv^2 hv^3 hw^5 ix^3 + 2 as^3 av^5 aw^5 br^2 bw^6 dr^6 ds^6
#> ey^4 fr^10 fu^2 fx^7 gs^4 gt^5 is^3 iw^6 + 7 as^3 av^6 bw cs^5 ct^4 cy^6 dr^5
#> dv^6 er^2 ey^7 fs^5 ft^3 gx^7 ht^4 is^4 + 73 as^4 au^3 av^10 az^7 br^5 dx^9
#> dz^4 ew^4 ez^9 fu^3 hx^7 hz^5 iu^4 ix^4 iz^8 + 25 as^6 at^8 ax^2 bz^5 eu^8 ex^5
#> fu^3 fz^7 gr^10 gy^11 hu^5 hz^6 iu^7 iv^8 iw^4 + 47 as^9 at^4 bv^5 cs^6 dv^4
#> dx^7 dz^8 et^4 ft^9 gs^5 gz^9 hw^8 is^5 iy^5 iz^9 + 63 as^9 ay^3 br^9 bv^5 bw^6
#> cr dy^6 eu^8 ex^7 fu^9 gy^9 hs^2 hz^8 it^6 ix^6 + 79 at^2 br dt dx ft hu^2 is +
#> 54 at^5 av^6 aw^13 ax^12 cr^2 cu^5 cy^5 ds^4 du^4 ev^8 ex^4 fs^8 fv^8 gv^7 gx^3
#> + 61 at^5 ay^11 br^4 bs^14 bt^3 bx^6 cw^7 dv^9 es^5 et^3 fr^6 fv^3 gr^9 ir^3
#> iv^6 + 99 at^6 bs^5 cr^2 cv^10 du^9 dz^6 eu^7 gx^6 hr^5 hu^5 hx^7 hy^5 ir^3
#> iy^4 iz^5 + 25 at^9 au^6 br^3 cr^3 cv^6 cx^6 dr^5 dv^10 es^5 fr^8 gs^7 gt^6
#> gw^7 hs^7 iw^5 + 31 au ay^5 cs^2 du^2 ev fx^4 fy^3 gx gz^2 hv^3 hy iw^3 iz^2 +
#> 78 au az bu bx cu ds^2 du ex + 3 au bs^2 cr ds^2 es ey fz^5 ht hu^3 hv^2 hy
#> hz^4 iu^2 iz^2 + 67 au bu^2 bv^5 by^3 cs^4 dt^2 et ey^3 fv gw^7 gx^3 hu^4 hz^3
#> iu^3 iz^5 + 17 au dw + 79 au^2 az^5 bv^2 cr^3 cy^2 dw^4 fr^3 fz^2 gr^2 gv^4
#> gw^4 iv^2 iw iz^3 + 76 au^3 br^3 bu^2 cr^5 ds^3 dv^3 dx^2 es^4 ex gw gx^4 hw^8
#> hy^5 is^3 iz^3 + 82 au^4 aw^3 br^3 bt^3 bv^3 ct^2 ds^8 dx^3 er ew^3 fw^2 hr^5
#> iu iw^3 iz^3 + 90 au^4 cu^6 dr^7 dt^5 dy^2 dz^8 er^7 et^3 gv^5 gz^5 hy^5 ir^5
#> iv^2 iw^5 iy^8 + 64 au^5 az^7 bu^3 bv^5 eu^6 ex^4 fu^3 gv gw^3 hs^4 ht hu^4
#> hv^5 ir^5 ix^3 + 56 au^7 av^6 aw^7 cw^10 cx^8 dx^6 ew^6 ez^3 fv^6 fy^7 gy^7
#> hv^7 is it^5 ix^8 + 32 au^7 aw^5 az^8 bt^6 ds^7 dx^10 dy^7 eu^7 fx^5 fz^7 gw^8
#> gy ht^5 ir^4 iz^4 + 17 au^8 ay^4 bs^4 bu^6 cy^2 cz^8 dv^3 dw^7 dx^5 dz^6 ew^6
#> fy^3 gu gx^5 hr^8 + 81 au^10 cr^6 cx^2 dw^8 er^5 ex^2 ft^7 fu^5 fz^9 gw^4 gz^4
#> ht^3 hw^7 hy^5 iv + 90 av br ds ex gr^2 gz^2 ht iy + 6 av bx cr cw^3 cx^2 ds^2
#> dt dx gr^2 gt^3 hu^2 hw^2 iz + 95 av^2 aw^7 br^6 bw^5 cu^6 dx eu^3 fr^5 fs^4
#> fu^4 fx^3 gt^2 hv^3 is^3 ix^5 + 23 av^2 ay br^2 cu^2 dv^3 ew^3 ey^2 gx ht^2 hw
#> + 96 av^2 bs^2 bx^3 cs^3 dt^8 du^3 es et^3 ew^4 fx^3 it^2 + 32 av^5 ax^4 bu^3
#> bv^4 cs cu^2 ey^5 ez^4 fu^3 gu^4 gv^2 hs^5 hx^3 hy^4 iv^3 + 67 av^6 ay^7 cr^6
#> cs^8 cy^2 du^9 dx^3 ex^9 fs^7 ft^5 fy^9 gw^5 hv^5 hz^8 iv^10 + 74 av^7 az^4
#> cu^5 cx^3 dy^5 ev^2 fr^6 gr gz^4 hs^3 ht^3 hx^2 iv^6 ix^4 iz^3 + 30 av^7 bt^4
#> bu^4 bw^3 ct^3 cu^6 cv^4 dx^5 ev^4 ex^2 ft^3 gt^2 hs^4 iv^6 ix^4 + 50 aw ax^2
#> bu^2 bw^2 er^2 ev ft iu^4 + 62 aw br^4 bu^2 bv^2 dv^6 es^5 ev^2 fu fw fx^5 fz^2
#> gr^2 gy^4 ht^3 + 89 aw cr fu iu^2 + 13 aw dz is + 37 aw^6 bv^3 bw^10 ct^8 cy^6
#> dw^7 et^4 fx^3 fy^2 gu^7 hs^4 ir^10 is^5 iw^6 iz^4 + 44 ax br dr dw fs^2 fz gw
#> + 91 ax bz^2 dx dz ey^2 fw fx fy^2 gt hy ir iz^2 + 48 ax^3 bu^6 cx^5 dr^2 dt^2
#> er^4 eu^5 fr^2 ft fv^5 gw^5 gz^5 hv^5 hy^5 iy + 12 ay^2 br by^3 cx^2 dr^5 ex^4
#> fy^2 gr^5 gx^3 hu^7 hw^4 iu^7 iw^4 iz^7 + 100 ay^4 az^3 bx^4 cy^4 dt^5 dy^4
#> dz^8 er^5 ev^3 gr^6 gt gz^6 hw^5 hx^6 iz^10 + 2 az + 92 az br^4 bs^2 bt^2 cr^3
#> ct^5 dr^5 dv^2 es^2 gu^2 iu iv^3 ix^2 iz + 68 az^2 bw^5 cr^3 du^5 fs^2 ft fx gv
#> hs hu hw^2 + 84 br^5 bv^5 bx^4 cs^5 dv^3 ex^6 ey^4 ez^3 fs^6 gs^6 gw^7 hu^6
#> hw^2 hy^3 iw^6 + 33 br^6 bu^6 bv^6 bw^3 bx^5 by^5 cv^9 ds^7 dw^9 fv^7 fy^5 gs^6
#> hw^4 is^4 iz^3 + 85 bs^2 bu^7 bv^7 bx^4 cs^5 cy^4 du^8 ew^3 fv^2 gt^3 gu^5 hv^5
#> hx^2 it^4 iy^4 + 80 bs^2 ct cy^2 cz dt es^3 gy gz^5 hv ir^2 is^2 it^2 iw^2 + 23
#> bs^2 ey it iw^2 + 82 bs^5 bu^7 bv^8 cu^3 cx^4 dr^4 dx^8 et^3 ez^5 fv^7 gu^5
#> gw^4 ht^3 hv^7 iv^4 + 50 bt by^5 cu cz dv es^3 ex ez^5 fs^2 fu^5 fy^2 gu^2 gw^3
#> hv^2 iw^3 + 60 bu cy^2 ex gu + 80 bv^5 bw^2 bx^3 by^3 cu^2 cv^3 cw^4 dx^4 dz
#> et^3 fr^5 gx^6 gz^4 is^4 iy^7 + 3 bw^3 cr^4 cs^4 cz^7 dv^3 dw er^3 et^7 fr^6
#> fw^2 gu^4 gv^2 gz^2 hw^2 + 42 bw^7 by^4 ct^7 du^7 dz ew fz^4 gr^2 gu^4 hu^4
#> hy^2 hz^10 is^3 iu^6 iw^5 + bw^11 cr^9 ey^5 fu^6 fx^5 fy^6 gu^6 gx^5 hu^5 hw^5
#> is^7 it^8 iu^3 iw^6 iz^7 + 15 bx^2 by bz^3 cw es^3 ev^2 ey^2 fy^3 gu gw^2 gy^2
#> hr ht^2 iu + 66 bx^3 dv^2 er ev^2 fv^3 gy^6 hs hu^5 hv^4 hw^2 hz^3 it iz^2 + 53
#> bx^5 bz^4 cw^7 cz^3 es^10 ex^6 ft^4 fu^5 fx fz^8 hr^3 hs^6 iv^10 iy^2 + 22 bx^6
#> by^4 dt^8 dv^3 es^6 ev^9 ex^9 ey^9 fv^5 fy^3 gt^7 gv^4 gz^9 hr^6 ir^4 + 7 bz^6
#> cr cs cv^6 dx^3 dy^8 et^6 fz^5 gw^4 gx^5 hr^3 hs hv^3 hy^2 ix^2 + 14 ct^2 cy^2
#> dy ew^3 fs gs gv^3 gw^2 gx^2 hz^2 iy + 22 cu cy ds ev fx gr gs hy ir + 96 cv^4
#> cw du^3 ev^2 ey^3 gr^3 gz hs^3 ht^2 hu^3 hv ir + 95 cv^4 du dw dx^3 eu^2 ez^3
#> fx^3 gw^2 gx^2 hy^2 iu + 49 cz^3 fz^2 hu + 55 dt dz + 9 fu
```
