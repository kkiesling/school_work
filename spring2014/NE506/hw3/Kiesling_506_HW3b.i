Kalin Kiesling HW3a - table setting
C =============================================================================
C Cell Card Start
C -----------------------------------------------------------------------------
C table
1 5 -0.77 (4 -5 -9 8 2 -3):(4 -9 -6 11 1 -2):(7 -5 -9 11 1 -2)
          :(4 -6 -10 8 1 -2):(-10 8 7 -5 1 -2)                          IMP:n=0
C -----------------------------------------------------------------------------
C plate
2 3 -2.4 (-21 22 -23 20):(3 -20 -21)                                U=1 IMP:n=0
C knife
3 1 -7.75 (3 -31 30 -32 33 -34):(-37 -34 35 -36)                    U=1 IMP:n=0
C fork
4 1 -7.75 (3 -31 30 -32 -40 41):(48 -49 -42 -43):-44:-45:-46:-47    U=1 IMP:n=0
C wine glass
5 2 -2.8 (-60 3 -49):(-61 3 62 -68):(64 -62 -68):(68 -66 65 -63)    U=1 IMP:n=0
C wine glass fill
6 4 -1 (-64 -68):(-65 68 -67)                                       U=1 IMP:n=0
C void around objects in universe 1
7 0 #2 #3 #4 #5 #6                                                  U=1 IMP:n=0
C -----------------------------------------------------------------------------
C creating the single place setting universe and replicating it
8 0 -100 fill=1                                                         IMP:n=0
9 Like 8 but trcl=1                                                     IMP:n=0
C -----------------------------------------------------------------------------
C surrounding void
10 0 (#1 #8 #9)                                                         IMP:n=0
C -----------------------------------------------------------------------------
C Cell Card End
C =============================================================================

C =============================================================================
C Surface Card Start
C -----------------------------------------------------------------------------
C Surfaces for the table, center of surface at (0,0,0)
1 pz -100      $ bottom of table legs
2 pz -5        $ bottom of table top
3 pz  0        $ top surface of table
C below defines 5 cm square legs at corners
4  px -50
5  px  50
6  px -45
7  px  45
8  py -50
9  py  50
10 py -45
11 py  45
C -----------------------------------------------------------------------------
C Surfaces for the plate centered at (0, -30, 0)
20 pz 0.5               $ thickness of plate
21 c/z 0 -30 15    $ outer surface of rim, theta=60 -8.16 t=3
22 c/z 0 -30 10    $ inner surface of rim, theta=60 -7.66 t=3
23 pz 1                 $ top edge of rim
C -----------------------------------------------------------------------------
C Surfaces for the knife
C handle
30 py -45       $ bottom edge of handle
31 pz 0.5       $ handle is 0.5 cm thick
32 py -35       $ top edge of handle
33 px 20        $ left edge of handle
34 px 21        $ handle is 1 cm wide
C curved 1 mm thick blade
35 pz 0.2       $ bottom plane of blade
36 pz 0.3       $ top plane of blade (0.1 cm thick)
37 c/z 40 -35 20 $ cylinder to create curvature of blade at tip
C -----------------------------------------------------------------------------
C surfacess for the fork
C use same pz planes for handle as knife (31)
C use surfaces 30,32 for top and bottom edge of handle
40 px  -20              $ right edge of handle
41 px  -21              $ left edge fo handle
42 c/z -20.5 -34.4 1.2  $ for curvature of prong area
43 py  -34.4            $ bottom edge of prongs
C edges of 4 prongs:
44 rpp -21.7 -21.4   -34.4 -31.8   0.1 0.4
45 rpp -21   -20.7   -34.4 -31.8   0.1 0.4
46 rpp -20.3 -20     -34.4 -31.8   0.1 0.4
47 rpp -19.6 -19.3   -34.4 -31.8   0.1 0.4
48 pz   0.1             $ bottom plane of prongs
49 pz   0.4             $ top plane of prongs
C -----------------------------------------------------------------------------
C Surfaces for the wine glass
60 c/z 15 -10 5
C 60 k/z 15 -10 1 0.0625 -1   $ base, tan(theta)=1/4
61 c/z 15 -10 0.5           $ stem, 1 cm thick
62 s   15 -10 14 4          $ curved bottom of cup part, outside surface
63 c/z 15 -10 4             $ make glass a taller w/ flat sides, outside surface
64 s   15 -10 14.3 3.85     $ inside of curved bottom part, 0.3 cm thick
65 c/z 15 -10 3.85          $ inside of taller part of glass, 0.3 cm thick
66 pz  19                   $ height of cup part
67 pz  16                   $ fill line of wine glass contents
68 pz  14.3                 $ midplane of spheres 62 & 64
C -----------------------------------------------------------------------------
C void box for universe
100 rpp -50 50 -50 0 0 30
C Surface Card End
C =============================================================================

C =============================================================================
C Data cards start
C -----------------------------------------------------------------------------
C === MATERIAL CARDS ===
C stainless steel for knife and fork: (density 7.75 g/cm3)
C 0.15% C, 0.5% Si, 1% Mn, 0.4% P, 0.03% S, 1% Ni, 13.5% Cr, 83.42% Fe
M1   6012 -0.14835 6013 -0.00165        $ C (0.15%)
     14028 -0.46115 14029 -0.02335 14030 -0.0155        $ Si (0.5%)
     25055 -1.00        $ Mn (1.0%)
     15031 -0.4         $ P (0.4%)
     16032 -0.028506 16033 -2.25e-4 16034 -1.263e-3 16036 -6e-6 $ S (0.03%)
     28058 -0.68077 28060 -0.26223 28061 -0.0114 
                   28062 -0.03634 28064 -0.00926        $ Ni (1.0%)
     24050 -0.58657 24052 -11.3115 24053 -1.2826 24054 -0.31927 $ Cr (13.5 %)
     26054 -4.838444 26056 -76.5128 26057 -1.83524 26058 -0.233576 $ Fe(83.42%)
C -----------------------------------------------------------------------------
C glass for wine glass (SiO2): (density 2.8 g/cm3)
M2   14028 0.9223 14029 0.0476 14030 0.031      $ Si
     8016 1.9952 8017 0.00078 8018 0.00402      $ O
C -----------------------------------------------------------------------------
C porcelain for plate (Al2Si2O5(OH)4), (density 2.4 g/cm3)
M3   13027 2 14028 2 8016 9 1001 4
C -----------------------------------------------------------------------------
C water for glass: (density 1 g/cm3)
M4   1001 2 8016 1
C -----------------------------------------------------------------------------
C wood for table, primarily cellulose (C6H10O5), (density 0.77 g/cm3)
M5   6012 5.934 6013 0.066                      $ C (6)
     1001 9.9985 1002 0.0015                    $ H (10)
     8016 4.988 8017 0.00195 8018 0.01005       $ O (5)
C -----------------------------------------------------------------------------
C === Transformation cards ===
TR1    0   0   0 
      -1   0   0  
       0  -1   0  
       0   0   1
C -----------------------------------------------------------------------------
C Data cards end
C =============================================================================
