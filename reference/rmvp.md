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
#> 6 a^2 b e f^2 + 5 a^2 b e^3 + 4 a^2 b^2 c e + a^3 c e f + 7 a^4 c d + 4 b^2 d^2
#> f^2 + 4 d e^3 f^2
rmvp()
#> mvp object algebraically equal to
#> 5 a d f + 4 b f + 7 b f^2 + 2 d^2 f^3 + 4 e + 6 e^2 + 5 f
rmvpp()
#> mvp object algebraically equal to
#> 2 a b c^2 d^2 f h + 27 a b e^3 f g^2 h^4 j^4 n o^2 + 16 a h k^3 l^2 o + a h^5 k
#> l^2 m o^2 + 20 a^2 b d^2 g^2 h j^4 k^3 l^2 o^3 + 17 a^2 e f^2 g h j^2 m^3 o^4 +
#> 15 a^2 f l + 14 a^3 b^2 e^3 f g^2 i^3 l^2 n^3 + 2 a^3 d^2 e f^5 j^2 k^2 n + 19
#> a^4 b c^2 i^2 j^4 m n + 30 a^4 f^2 h j k^2 l^2 n^2 o^4 + 9 b c^2 e^2 j k^6 n^2
#> o^3 + 17 b d^2 e^2 f^2 m o + 25 b d^2 e^5 g^2 k l^5 o^3 + 28 b d^2 h i j l^3
#> m^2 o^5 + 2 b e^2 f j k^2 l m^2 + 10 b^2 c f n + 24 b^2 f^4 k m^4 + 4 b^3 c d
#> e^3 f^2 i^3 k^3 m^3 + 20 c g k^2 n + 27 c^2 e^2 g h l^4 m + c^2 g h^3 i k^2 m
#> n^4 o + 12 c^2 g j l m^2 o^2 + 11 d i j + 27 d^2 e h i^4 j k l m o + 14 d^2 g
#> i^2 l o^3 + 3 d^4 e^2 g i j m^2 + 9 d^4 f^2 i m n^2 + 17 e g k l n o + 16 i
rmvppp()
#> mvp object algebraically equal to
#> 31 ar ax^3 br^5 bs cs^2 dr^3 dt^4 fv^2 gw^3 gy^2 ht hy^2 ix + 91 ar bt ct cy
#> dr^2 dt dw ey^2 gy^2 gz hu ir^2 + 22 ar cv dt fr fs gz hv hz ix + 42 ar^2 as^4
#> ay^10 cs^7 cy dy^4 er^4 ew^7 fu^7 gs^6 gv^3 gw^5 hs^4 hz^2 iw + 7 ar^2 av ax^3
#> az^3 cr^8 ct^3 dy^5 ey^6 fv fx^6 fz gt^2 ht^5 hw^4 iu^6 + 98 ar^2 av bw^2 bx bz
#> dy ew ex^2 ey gw^2 gz^2 hy^3 + 95 ar^2 cs ct^3 cw dt^3 fx^4 gs ht^2 hw^2 is^2
#> iy^3 + 32 ar^4 at^3 av^5 bt^4 bx^5 ds^3 es^3 ex^4 fs^2 fv gx^3 hs^4 hx^2 ir^5
#> iy^4 + 41 ar^4 cw^6 ds^8 dy^2 ey^5 fu^10 fy gx^4 hu hw^5 hy^2 it^7 ix^9 iz + 15
#> ar^5 as^4 at^5 ax^4 az^4 br^4 bz^6 cv^5 dz^9 fr^9 fw^6 fy^8 hr^6 hz^3 iu^4 + 99
#> ar^5 as^5 at^7 az^5 bu^6 cs^9 cy^6 ev^5 fx^10 fz^2 gr^4 gy^5 gz^3 ht^6 is^7 +
#> 76 ar^5 aw^8 bs^3 ct^2 cv^3 cx^3 es^2 ez^3 fz^5 gv^3 gy^3 ht^4 hw it iv^4 + 48
#> ar^5 ax^5 bt^3 cu^2 cz^2 du dx^5 dz^2 es^6 ft^5 gr hw^5 hy^5 is^5 iz^4 + 95
#> ar^5 br^8 bx^7 bz^9 cr^9 ct^5 cv^9 du^6 dw^4 ey^6 fr^2 fx^5 hr^7 ht^6 hw^6 + 90
#> ar^5 bs^4 cr^2 cu^5 cy^8 cz^7 fs^6 gr^8 gw^5 gx^2 gz^5 hx^5 hy^5 iu^3 iz^7 + 23
#> ar^5 bz^3 cr^7 cw cx^5 du^2 dv^2 fs^4 fu^7 fv fw^4 hx^2 hz^6 ir^2 iw^2 + 18
#> ar^6 at^4 ax^9 bt^3 bx^8 bz^8 dt^6 dy ex^5 fx^8 fz^8 gz^5 hx^3 hz^7 iv^9 + 57
#> ar^7 as^4 aw^7 ax^4 bu^5 cx^3 es^7 et^7 ex^4 ez^4 gw^8 hs^4 hv^9 it^6 iy^4 + 68
#> as av aw^2 by^2 cs^5 dt du dv^2 ew^5 fz^3 hx + 94 as dy^2 fy^3 + 6 as^2 aw^2 bx
#> ct cu cv^2 et ft^2 fw^3 fz gy hu^3 hz^2 + 79 as^2 bu^2 ct cu du ez gv + 96 as^3
#> au^2 av^3 ax cs^3 fw fx^4 gz hy hz^3 ir^3 ix^2 + 64 as^4 au av^4 ax^5 bs^5 by^7
#> ds^3 es^3 ex^5 gt^3 gz^5 hw^3 hx is^6 it^4 + 67 as^4 ay^3 bs cu^2 dx er^3 es^2
#> ex^5 fv^4 gs^3 gy^5 ht^3 hw^7 ir^3 iu + 2 as^4 az^2 bs bw^4 bz^7 cw^7 cx dr^5
#> fu^11 fw^4 gr^2 gw^9 hr^5 hs^3 hx^5 + as^5 aw^5 dr^6 ds^6 dt^5 ew^11 fz^9 gs^3
#> gu^8 gv^7 gw^6 gy^7 hs^6 ht^5 ir^5 + 46 as^5 ax^4 bv^6 bw^6 by^4 bz^4 ct^8 cu^3
#> dr^10 dt^9 dv^7 dy^11 gz^8 hx^5 ir^3 + 25 as^5 ay^6 bt^2 bu^8 bv^6 ds^3 dy^7
#> ey^5 gs^7 gw^4 gx^8 hr^11 hz^10 is^8 it^5 + 55 as^6 bx^2 bz^8 cr^4 cu^3 cz^2
#> du^5 ex^3 ez^4 fu^6 gt^5 hr^5 hs hy^4 ir^5 + 12 as^7 aw^4 br^2 cz^5 dr^2 er^3
#> ez ft^2 gs^7 gw^4 gy^7 ht^3 hz^5 it^4 + 4 at aw^2 ax^2 br^4 bu^3 bv by^2 cu^4
#> ds^4 fw gw^2 hv iu^2 + 74 at^2 au^3 av^3 bx^7 by^4 cr^5 dz^6 fs^5 ft^3 gt^4
#> gx^6 gy^3 hy^4 hz ix^2 + 50 at^2 aw^4 by^2 bz et^4 ew ez^2 fv gv^2 gz iz + 85
#> at^2 ax^5 cs^8 dx^2 es^7 et^4 ev^2 ex^7 fr^4 fv^5 gr^4 gu^4 hs^5 hu^3 iw^3 + 57
#> at^3 bs^6 bx^5 bz cy^9 cz^7 dr ds^7 dw et^3 ew^5 gr gt^6 gx^2 hy^3 + 81 at^5
#> av^6 aw^5 bt^7 bv by bz^6 cu^3 dr^4 dt^3 ez^5 fx^2 gs^6 gx^5 gy^2 + 100 at^6
#> aw^5 br^4 by^3 cr^4 cu^5 cy^8 et^4 fr^4 gy^10 hu hy^6 hz^6 ix^3 iz^5 + 90 au bx
#> cv ez gr hy^2 hz^2 it + 15 au^2 az dr^3 er et^2 ey^3 fw gs hr^2 hs hw^2 ir^2
#> iv^3 ix^2 + 82 au^3 ax^7 ct^8 cz^4 dx^7 es^7 ev^5 ex^8 fs^3 ft^4 gx^4 hs^5 hw^4
#> iu^3 iy^5 + 62 au^3 bv^6 bz^3 cv^5 ds^8 fs^4 fw^3 fz^5 gy^8 gz^8 hs^4 it^5 iw^5
#> iy^6 + 62 au^3 bw cx^6 ds dt^5 dw dy^2 es^2 ex^2 ez^4 hr^4 hz^2 iv^5 ix^2 + 63
#> au^4 ay bz^5 cr^2 cs^4 cv^3 cw^3 dt^6 du^5 eu^6 gy^5 hu^5 ir^5 iv^6 ix^4 + 7
#> au^4 bv^3 bx^6 cx^6 cz^5 du^3 dv^5 ew fr^6 fu^4 fv^5 gv^4 ht^7 ir^7 iz^2 + 32
#> au^5 bs^7 bw^5 by^8 cr^7 ct^10 cv^7 dt^5 dy^7 eu^6 gy^4 gz^4 hr hw^8 is^7 + 94
#> au^7 bs^3 bw^3 by^5 bz^2 ct^7 cz^4 dr^3 dw^6 ey^3 gw^4 gx^5 hr^7 ht^7 iz^5 + 15
#> av ax^5 bz^4 dv^5 dw^4 dz^7 er^5 es^8 ey^9 gw^5 hs^7 hv^2 ir is^6 iy^2 + 63
#> av^2 ay^8 br^3 bv^9 cr^6 ds^9 ew^6 ex^5 ez^9 fz gt^6 gu^6 hr^9 is^8 it^7 + 46
#> av^2 bz^3 cr^5 cz^2 dv dx^2 dy ey^2 fs gx^2 gz^4 hs^3 hy hz^3 iy^3 + 61 av^4
#> ay^2 bs^6 bx^8 bz^6 cv^4 dz^5 ez^5 fx^10 gt^3 hu^3 hz^6 it^3 iv^6 ix^9 + 37
#> av^4 bw^6 cw^7 dr^2 dt^3 ew^10 ex^3 fr^6 fu^8 gv^5 gw^6 gy^4 gz^10 hs^7 iu^4 +
#> 30 av^4 bx^7 ct^5 du^3 es^4 eu^4 ew^3 fs^6 fu^3 fx^4 gt^4 gx^6 hu^2 it^2 ix^4 +
#> 18 av^6 az^2 bs^6 bv bw^3 cw^5 dw^6 et^3 ev^7 fv^3 fw^9 gy^3 hr^9 ht^9 it^8 +
#> 53 av^6 az^3 ds^5 dt du^4 dy^8 et^5 ey^4 fw^7 fy^3 gr^2 gx^10 it^6 iv^10 + 25
#> av^7 bs^6 bu^9 cx^10 cz^5 dz^8 ez^3 ft^6 fx^6 fz^3 gw^5 hu^6 hv^7 hw^7 iv^5 + 6
#> aw bx bz cy dy^2 fv gx^2 hu it^2 + 3 aw^2 cw cx^3 dw^2 dz^6 ew^3 fv^4 fy^7 fz^4
#> hs^4 hx^2 hy^2 iu^7 iz^3 + 65 aw^3 br^4 bu bz^2 cx^7 dv^6 dz^2 ez^5 fs^6 fu^5
#> gs^3 gu ir^6 iw^6 + 42 aw^4 br^5 cv^7 cw^6 dr^7 dx^2 er^6 es^3 et^4 ex^4 ez^6
#> fx^3 gv^4 gy^4 hv^3 + 36 aw^4 bv^6 bz^3 cz^3 et^4 eu^2 gt gw^3 gx^3 hr hs^2
#> hy^4 iu^4 iw^2 + 88 aw^5 ax^3 bs^3 bv^2 bw cs^2 dx ev^2 ex^2 fz gt^3 hu^4 hx^2
#> iv^2 iz^4 + 72 aw^9 bu^6 bz^2 ct^9 dy^8 es^8 ey^8 ez^6 fy^7 fz^5 gs^10 gu^3
#> gz^4 ht^2 ix^10 + 80 ax cu ev^2 fr^2 fu fy gu^2 gv^2 gw^2 gz^2 hr hy^5 iv^3 +
#> 50 ax^2 cx dr^2 ds^5 dv^2 er^5 eu fs fy gw^3 hs^2 hw^3 it iv^3 iy^5 + 95 ax^3
#> bw^7 bx^2 ct ds^4 dt^3 dv^4 dz^5 ew^5 ez^6 fs^6 gt^5 gv^3 hu^2 is^3 + ax^3 cv^7
#> cw^4 dx^2 dy^5 et^6 ew^4 ez^4 fx^2 fy^5 it^6 iv^6 iw iy^2 iz^5 + 4 ax^6 az^6
#> bz^6 cx^7 dr^7 dv^9 dy^4 ey^4 fs^3 fw^7 gs^12 gx^9 gy^5 ir^7 ix^5 + 56 ax^7
#> bs^7 bw^7 bx^6 ct^6 dr^7 dx^6 ft^8 fw^10 gt^8 gu^5 gv hr^7 iw^6 iy^3 + 95 ay az
#> bw^2 cx^2 dx ey fz^4 gw^2 gx^2 gy^2 hw^3 iu^2 iv^2 ix + 14 ay^2 cr dv fr^2 fu^2
#> gr ht^2 hv hw^2 hx^3 iw^3 + 98 az^2 bu^3 bz^6 dr^3 dw^3 et^5 eu^8 gt^3 hr^2
#> hv^6 hw^4 ir^8 iv^7 iz^6 + 82 az^5 bs^4 bw^3 ct^3 cv^8 dw^2 eu^3 ex^3 ez^3 fu^2
#> gs gw^3 gy^3 iw^3 iz + 22 az^6 cu^8 cx^3 dr^3 dx^5 er^4 et^6 gz^4 hu^7 hx^4
#> hy^9 ir^9 it^9 iv^6 ix^9 + 17 az^8 br^4 bs^8 ct^5 cw^7 cx^3 cy^6 dr^3 es^6 ev^4
#> fr^2 fy^8 hs ht^5 iw^6 + 61 br^11 bu^5 cx^9 dx^3 dz^6 et^6 eu^3 ev^14 ez^4 fw^7
#> gx^6 gz^3 hz^9 iu^3 iv^5 + 78 bs by cs cv^2 es et fs it + 15 bs bz et ft^2 gx^2
#> gy hv^3 hx^2 hy ix + 17 bs cw + 79 bs^2 by^5 cw^4 dy^2 dz^3 ex^2 fr^2 fz^3 gw
#> gx^2 gy^3 hw^4 hx^4 hz^2 + 3 bt bz^3 cu^3 cx^3 ds dt dz^3 er^5 ft gu^7 gx gz^4
#> hv^2 hy^2 hz^2 + 44 bt cw cz dv^2 dy ez hw + 50 bt^2 bw du es^2 ew^2 gs^4 ix
#> iz^2 + 4 bt^10 bz^5 cx^8 du^4 dw^6 es^6 ev^8 fu^6 gt^6 gw^5 gz^5 hr^10 hw^6
#> ir^3 iu^7 + 54 bt^12 bu^5 bw^13 bx^6 cs^4 cv^4 dv^8 dx^8 fr^5 fs^5 fz^2 ht^3
#> hx^7 it^4 ix^8 + 22 bv^7 bw^2 bx^3 cv^10 cz^9 ds^2 dt^4 dz^7 ew^13 ez^5 fx^9
#> gv^7 gw^7 hv^7 is^4 + 13 bw cy gv + 89 bw ds fz gs^2 + 96 bx^2 cs^3 cu^8 dt^3
#> et^3 ev^2 fv^3 gu^2 iu^3 iv iw^4 + 25 bx^2 cw^2 cy^4 dv^3 ev^3 fs^2 fv^2 fz
#> gw^5 gx^3 hv^4 hy it^5 iv^2 + 2 by + 92 by cx^2 cz^5 eu^2 ev^2 ez^4 fu^5 fz^3
#> gs gt^2 gx^3 gy hs^2 iv^2 + 66 bz^7 ct^4 du^8 er^3 fs^6 ft^6 fv^7 gr^5 gs^6
#> gw^7 gz^3 hv^4 hw^9 hx^4 it^5 + 99 ct cz dz fr iw + 80 ct^4 cy dz^5 er^3 et^3
#> ew^2 ex^5 fs^2 fw^4 fx^3 gr^7 gv^4 ht^6 hy^4 iu^3 + 45 cu + 55 cu cy + 9 ds +
#> 60 es fr^2 hs it + 23 ev^2 gu gw^2 ir
```
