Input file for HW #5
C Cell cards
1 1 -1.85    -1  3         imp:n=1  $ Be Sphere
4 3 -4.5        -3  4      imp:n=1  $ tritiated target
3 0             -3 -4      imp:n=1  $ beam tube
5 2 -1        1 -5  3 6    imp:n=1  $ water jacket
6 0           1 -5   -6 7  imp:n=1  $ detector tube
7 4  -3.7              -7  imp:n=1  $ NaI Detector
100 0         5            imp:n=0

C Surface cards
1 so 25
3 rcc 0 -50 0  0 50.5 0  2
4 py -0.5
5 rpp -50 50 -50 50 -50 50 
6 rcc 0  0  0   0 50 50     4
7 rcc 0 35 35   0   5   5   3.9
104 py 0

C Data cards
mode n p
nps 2000000
C Materials
m1 4009 1   $ simple Be description
m2 1001 2 8016 1 5010 0.05 $ borated water
m3 22048 95 1003 5  $ tritiated titanium target
m4 11023 1 53127 1  $ NaI for detector
C Source
C this problem assumes an isotropic 14 MeV neutron source 
C at the origin
sdef
C Assume a physical source strength of 1e9 n/s
C 1. Establish an energy grid for all tallies with 44 bins spaced
C    logarithmically between 1e-10 and 10 MeV and 4 bins spaced 
C    linearly between 10 and 20 MeV
E 1e-10 43ilog 10 3i 20
C 2. Plot the energy spectrum of the current leaving the Be sphere and
C   compare to the energy spectrum of the current reentering the Be
C   sphere.  Arrange your output in a table with energy and direction.
F1:n 1
C1 0 1
FQ1 E C
C 3. Determine what fraction of the flux that reaches the detector has
C   streamed directly from the Be sphere.  Plot the flux spectrum that 
C   streamed directly in comparison with the total flux spectrum.  
C   Arrange your output in a table that makes it easy to make this 
C   comparison.
F4:n 7
SF4 6.1
FQ4 E F
C 4. Determine the total heating in the NaI detector and what fraction 
C   comes from neutrons vs. photons.  Report your answers in W.
*F6:n 7
FM6 1.25e21 $ multiplier 10**9 J/jerk * 1250 g * 10**9 n/s
*F16:p 7
FM16 1.25e21 $ multiplier 10**9 J/jerk * 1250 g * 10**9 n/s
C 5. Determine the rate of (n,2n) reactions occuring in the Be sphere
C   Report your answer in reactions/s.
F14:n 1
FM14 -6.51299E+13 1 16
C 6. Create a mesh tally in the entire water block.
C   For the region that includes the Be sphere, use 1 cm mesh.
C   For the next 15 cm, use a 3 cm mesh.
C   For the remainder of the mesh, use a 5 cm mesh.
C   Tally both the photon and neutron fluxes.
C   Produce a plot of these mesh tallies in the Y-Z plane
FMESH24:p geom=xyz origin=-55 -55 -55 imesh=-40 -25 25 40 55 iints=3 5 50 5 3 
          jmesh= =-40 -25 25 40 55 jints=3 5 50 5 3 
          kmesh=-40 -25 25 40 55 kints=3 5 50 5 3
FMESH34:n geom=xyz origin=-55 -55 -55 imesh=-40 -25 25 40 55 iints=3 5 50 5 3 
          jmesh= =-40 -25 25 40 55 jints=3 5 50 5 3 
          kmesh=-40 -25 25 40 55 kints=3 5 50 5 3
C 7. Using the ICRP 21 flux-to-dose conversion factors in Appendix H, 
C   calculate the neutron and photon doses at the point (0,49,49)
F5:n 0 49 49 1
DE5 2.5e-8 1e-7 1e-6 1e-5 1e-4 1e-3 1e-2 1e-1 5e-1 
       1 2.5 5 7 10 14 20
DF5 3.67e-6 3.67e-7 4.46-6 4.54e-6 4.18e-6 3.76e-6 3.56e-6 
              2.17e-5 9.26e-5 1.32e-4 1.25e-4 1.56e-4 1.47e-4 
              1.47e-4 2.08e-4 2.27e-4
F15:p 0 49 49 1
DE15 0.01 0.03 0.05 0.07 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 
            0.5 0.55 0.6 0.65 0.7 0.8 1.0 1.4 1.8 2.2 2.6 2.8 3.25
            3.75 4.25 4.75 5.0 5.25 5.75 6.25 6.75 7.5 9.0 11.0
            13.0 15.0
DF15 3.96E-06 5.82E-07 2.90E-07 2.58E-07 2.83E-07 3.79E-07
       5.01E-07 6.31E-07 7.59E-07 8.78E-07 9.85E-07 1.08E-06
       1.17E-06 1.27E-06 1.36E-06 1.44E-06 1.52E-06 1.68E-06
       1.98E-06 2.51E-06 2.99E-06 3.42E-06 3.82E-06 4.01E-06
       4.41E-06 4.83E-06 5.23E-06 5.60E-06 5.80E-06 6.01E-06
       6.37E-06 6.74E-06 7.11E-06 7.66E-06 8.77E-06 1.03E-05
       1.18E-05 1.33E-05





C Blank line above makes these comments

