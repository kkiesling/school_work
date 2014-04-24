variance reduction problem
1 1 -2.03  -1
2 0        -2
3 1 -.0203 -3
4 0        -4 3
5 0         1 2 4

1 rcc 0 0 0       0 180 0    100
2 rcc 0 180 0     0 1820 0   100
3 rcc 0 2000 0    0 10 0     100
4 rcc 0 2000 0    0 10 0     201
 
c        the following is  pseudo-concrete
m1    1001 -.010      6012 -.001      8016 -.529
     13027 -.034     14000 -.337     26000 -.014
sdef   pos=0 1.e-6 0 cel=1 wgt=1  erg=d1 $ vec=0 1 0 dir=d2 
si1    2 2.00000001 14 14.00000001
sp1   0 .5 .5 1
C SB1 0  1  1  10
C si2 -1 0 1
C sp2 0 1 1
C sb2 0 0
f1:n  1.2
f4:n  3
f5:n  200 2005 0 0
EXT:n .99 0 0 0 0 
FCL:n 0 0 .99 0 0 
nps   5000000
wwp:n j j j j -1 j
wwg 1 1 0 J J J J 0
Mesh geom=cyl ref=0 0 0 origin=0 0 0 axs=0 1 0 imesh=100 iints=1
        jmesh=180 jints=5 kmesh=1 kints=0
imp:n 1 1 1 1 0
