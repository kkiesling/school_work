Simple aqueous reactor model
C Cell cards
1  1 -1   -1 2 3 4 5 6
2  2 -1   -2 -102
12 0      -2  102
3  2 -1   -3 -103
13 0      -3  103
4  2 -1   -4 -104
14 0      -4  104
5  2 -1   -5 -105
15 0      -5  105
6  3 -4   -6  106 $ remove 106 for control rod insertion
16 0      -6 -106 $ comment out for control rod insertion
7 0 -7 1 2 3 4 5 6
100 0  7 

C Surf cards
1 RCC   0   0 0 0 0 100 50
2 RCC  25   0 0 0 0 100  4
3 RCC   0  25 0 0 0 100  4
4 RCC -25   0 0 0 0 100  4
5 RCC   0 -25 0 0 0 100  4
6 RCC   0   0 0 0 0 100  4
7 RCC   0   0 0 0 0 120  560
102 pz 20
103 pz 40
104 pz 60
105 pz 80
106 pz 51

C Data cards
kcode 10000 0.945 25 75
ksrc  5 5 50
imp:n 1 11r 0  
C Materials
M1 1001 2 8016 1 92235 0.0066 92238 0.0934
M2 1001 2 8016 1 5010 0.005
M3 5010 1
FMESH14:n geom=xyz origin=-55 -55 -5
        imesh=55  iints=22
        jmesh=55  jints=22
        kmesh=105  kints=22
F7:n (1 2 3 4 5 6 7)
SD7 1
FM7 1.6e-19
F5:n 0 500 100 1
FM5 2.10308e16 $ # of source particles (taken from Power/F7tally)
DE5 2.5E-08 1E-07 1E-06 1E-05 1E-04 1E-03 1E-02
     1E-01 5E-01 1 2.5 5 7 10 14 20             
DF5  3.67E-06 3.67E-06 4.46E-06 4.54E-06 4.18E-06
      3.76E-06 3.56E-06 2.17E-05 9.26E-05 1.32E-04       
      1.25E-04 1.56E-04 1.47E-04 1.47E-04 2.08E-04       
      2.27E-04




C The above blank line ensures that the following will be treated as comments
1. Determine the U-235 enrichment that will make this system critical.
   Give an answer to the nearest 0.1%
2. Show that this is subcritical with the central control rod fully inserted.
3. Create a Cartesian mesh tally with a 3 cm mesh over the entire
   system.  Provide the following plots:
   * across the core at axial heights of 30 cm, 55 cm, 75 cm
   * on the y-z plane

