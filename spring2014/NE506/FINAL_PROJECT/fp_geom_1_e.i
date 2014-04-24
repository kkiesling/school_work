KIESLING - NE 506 - FINAL PROJECT - SPRING 2014 - GEOM1
C First geometry: monodirectional electrons on irregular block of tungsten
C Cell Cards
1 1 -19.3 (-7 +6 -8 -5 +1 -2):(+3 +4 -6 +1 -2 -5) IMP:e=1
2 0 #1 IMP:e=1

C Surface Cards
1 px -2
2 px  2
3 p   0 .5 .5  0 1 2.5  2 .5 .5
4 p   0 .5 .5  0 2.5 0  2 .5 .5
5 py  2.5
6 p   0 0 4  0 1 2.5  2 0 4
7 pz  4
8 p   0 2.5 3  0 2 4  2 2 4

C Data Cards
C Materials
C tungsten; rho = 19.3 g/cc
M1 74000 -1 
C source cards
mode p e
sdef PAR=3 VEC=0 1 0 DIR=1 POS=0 -3 2
nps 10000
F11:e 1 2 3 4 5 6 7 8 $ (1 2 3 4 5 6 7 8)
F12:e 1 2 3 4 5 6 7 8 $ (1 2 3 4 5 6 7 8)
F14:e 1
E14 0 20I 14
fmesh24:e geom=xyz origin=-3 -1 -1 imesh=-1 2 4 iints=2 2 2
           jmesh=2 3 jints=2 2 kmesh=1 3 5 kints=2 2 2
           emesh=0 20I 14
c FQ14 F E
c print 110
