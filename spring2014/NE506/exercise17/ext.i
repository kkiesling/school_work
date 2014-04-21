Input file for testing exponential transform
C cells
1 1 -1   -1   imp:n=1
2 0       1   imp:n=0

C surfaces
1 rcc 0 0 0 150 0 0 30

C data
sdef pos=1e-6 0 0 vec=1 0 0 dir=1
m1 1001 2 8016 1
f1:n  1.2
c1 0 9i 1 t
fq1 c f
nps 12000
ext:n .9x      $ .9 found to be best
C wwp:n 4j .25
C weight window decreases FOM

