Kalin Kiesling - NE506 HW4 - part 3 - brachytherapy
C =============================================================================
C Cell Card Start
1 1 -12 -1                                  IMP:p=1 $ sphere 3
2 like 1 but TRCL=1                                 $ sphere 2
3 like 1 but TRCL=2                                 $ sphere 1
4 like 1 but TRCL=3                                 $ sphere 4
5 like 1 but TRCL=4                                 $ sphere 5
6 2 -.0012 -2 -4 5 #1 #2 #3 #4 #5           IMP:p=1 $ inside inner cylinder
7 3 -4.5 (-3 -6 4):(-3 2 -4 5):(-3 -5 7)    IMP:p=1 $ inside outer casing
8 0 3:6:-7                                  IMP:p=0 $ surrounding void
C Cell Card End
C =============================================================================

C =============================================================================
C Surface Card Start
1 so .03
2 cz .035 $ inner cylinder
3 cz .04  $ outer cylinder
4 pz .15
5 pz -.15
6 pz .25
7 pz -.25
C Surface Card End
C =============================================================================

C =============================================================================
C Data Cards Start
C === TRANSLATION CARDS ===
tr1 0 0 .06
tr2 0 0 .12
tr3 0 0 -.06
tr4 0 0 -.12
C === MATERIAL CARDS ===
M1 46000 1 $ palladium
M2 6000 .00015 7000 .784431 8000 .210748 18000 .004671 $ air
M3 22000 1 $ titanium
C === SOURCE CARDS ===
C sources are 5 spherical volumes
mode p
nps 10000
sdef pos=d1 rad=d2 erg=fpos=d3 par=2
C Dist 1: sample for which center of sphere
si1 L 0 0 -.12   0 0 -.06   0 0 0   0 0 .06   0 0 .12
sp1      1          2         3        4         5 
C Dist 2: sample for radius based on sphere; all are identical
si2 0 .03
sp2 -21 2
C Dist 3: describes energy, dependent on position dist (D1),
C         each follows different distribution (11-15)
ds3 S    d11        d12        d13       d14        d15 
C Dist 11: energy dist for sphere 1; constant 30 keV
si11 L .03
sp11    1
C Dist 12: energy dist for sphere 2; Gaussian FWHM=.002 keV and mu=10 keV
C FWHM=a*ln(2)^(.5) --> a=.0024022
sp12 -4 .0024022 .01
C Dist 13: energy dist for sphere 3; discrete 10 keV, 20 keV, 30 keV
si13 L .010 .015 .020
sp13     1    1    1
C Dist 14: energy dist for sphere 4; evenly distributed 20-30 MeV
si14 H   .02 .03
sp14 D  0   1
C Dist 15: energy dist for sphere 5; piecewise linear
si15 A 0 .01 .02 .025
sp15   0  .5  0   1
C Data Cards End
C =============================================================================
