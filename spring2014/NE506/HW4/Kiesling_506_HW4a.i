Kalin Kiesling HW4a - Initials
C =============================================================================
C Cell card start
C 4 regions: K, R, K, and surrounding vaccuum
C -----------------------------------------------------------------------------
C first K filled with Na
1 1 -0.968 (+10 -11 1 -2 3 -4):(-15 14 11 -2 3 -4):
                               (12 -13 -14 1 3 -4)      IMP:n=1
C -----------------------------------------------------------------------------
C R filled with Ar
2 2 -0.001784 (3 -4 22 -23 -2 1):(3 -4 26 -27 -28 1):(3 -4 -2 25 23 -29)
             :(3 -4 23 -29 -24 28):(3 -4 20 -21 29)     IMP:n=1
C -----------------------------------------------------------------------------
C last K filled with Na
3 1 -0.968 (+30 -31 1 -2 3 -4):(35 -34 31 -2 3 -4):
                               (32 -33 31 1 3 -4)       IMP:n=1
C -----------------------------------------------------------------------------
C surrounding vacuum
4 0 -1:2:-3:4:-10:(11 15):(11 -12):(-14 13 -22):(23 -26):(23 -25 24 -29)
        :(29 -20):(21 29 27 -30):(31 -35):(34 33):(31 -32)  IMP:n=0
C -----------------------------------------------------------------------------
C Cell card end
C =============================================================================

C =============================================================================
C Surface Card start
C -----------------------------------------------------------------------------
C all surfaces 0* are used for more than one initial
1  py 0         $ bottom edge of all letters
2  py 30        $ top  edge of all letters
3  pz 00        $ bottom plane of all letters
4  pz 10        $ top plane of all letters
C -----------------------------------------------------------------------------
C all surfaces 1* are for first initial K
10 px 0
11 px 10
12 p  20 0 0   0  20 0   10 10 10       $ bottom edge of bottom
13 p  30 0 0   10 20 0   20 10 10       $ top edge of bottom
14 p  0  0 0   10 10 10  30 30 0        $ bottom edge of top
15 p  -10 0 0  0  10 10  20 30 0        $ top edge of top
C -----------------------------------------------------------------------------
C all surfaces 2* are for second initial R
20 c/z 60 20 5  $ inner
21 c/z 60 20 10 $ outer
22 px  40
23 px  50
24 py  15
25 py  25
26 p   60 0 0   50 10 10   40 20 0      $ bottom edge
27 p   70 0 0   60 10 10   50 20 0      $ top edge
28 py  10
29 px  60
C -----------------------------------------------------------------------------
C all surfaces 3* are for third initial K (same as last but +80 in x)
30 px 80
31 px 90
32 p  100 0 0   80 20 0   90  10 10     $ bottom edge of bottom
33 p  110 0 0   90 20 0   100 10 10     $ top edge of bottom
34 p  80  0 0   90 10 10  110 30 0      $ bottom edge of top
35 p  70  0 0   80 10 10  100 30 0      $ top edge of top
C -----------------------------------------------------------------------------
C rpp for cell rejection source method
40 rpp -5 35 -5 35 -1 11
C Surface Card end
C =============================================================================

C =============================================================================
C Data cards start
C -----------------------------------------------------------------------------
C Transformation Card
TR1 45 0 0 
TR2 45 0 0
C -----------------------------------------------------------------------------
C Material Card
M1 11023 100                                    $ Na-23 for K
M2 18036 0.337  18038 0.063  18040 99.6         $ Ar-36, 37, 40 for R
C -----------------------------------------------------------------------------
C Source Card
C probability of emission in each letter proportional to letter volume
C K=24 units R=25.6416 units
mode n
sdef AXS=0 1 0 CEL=D10  POS=FCEL=D20  ERG=FCEL=D30 RAD=FCEL=D40 EXT=FCEL=D50
C 10 --> choose cell based on volume
SI10 L    1        2          3 
SP10 D   24      25.6416     24
C 20 --> position based on cell
DS20 S d21 d22 d23
SI21 L 15 15 5 $ left K center
SP21  1
SI22 L 65 15 5 $ R center
SP22 1
SI23 L 95 15 5 $ right K center
SP23 1
C 30 --> Energy
DS30 S d31 d32 d33
SI31 L 3
SP31 1
SI32 H 4 5
SP32  0 1
SI33 L 3
SP33 1
C 40 --> rad (includes all of each letter)
DS40 S d41 d42 d43
SI41 0 16
SP41 -21 1
SI42 0 16
SP42 -21 1
SI43 0 16
SP43 -21 1
C 50 --> extent (includes all of one letter, y direction)
DS50 S d51 d52 d53
SI51 -16 16
SP51 -21 0
SI52 -16 16
SP52 -21 0
SI53 -16 16
SP53 -21 0
nps 5
print 110
C -----------------------------------------------------------------------------
C Data card end
C =============================================================================
