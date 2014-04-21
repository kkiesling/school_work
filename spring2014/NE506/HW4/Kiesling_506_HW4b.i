Kalin Kiesling - NE506 HW4 - part 2 - electron beam
C =============================================================================
C Cell cards
1 1 -19.3 -1 -2 3   IMP:pe=1
2 0 #1              IMP:pe=1
C =============================================================================

C =============================================================================
C Surface cards
C Tungsten target, 0.01 cm thick, r=1 cm
1 cz 1
2 pz 0
3 pz -.01
C =============================================================================

C =============================================================================
C Data Cards 
C ----- Material Cards -----
M1 74000 -1     $ tungsten, rho=19.3 g/cc
C ----- Source Cards -----
C 6 MeV electron beam traveling in -z direction
C x position: gaussian, mu=0 cm, FWHM=0.1 cm
C y position: gaussian, mu=0 cm, FWHM=0.15 cm
C z position: 5 cm
sdef par=3 x=d1 y=d2 z=5 erg=6 vec=0 0 -1 dir=1
sp1 -41 .12011 0
sp2 -41 .18017 0
mode p e
nps 10
C =============================================================================
