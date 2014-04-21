title goes here
C Cell Cards begin
1 1 -10     -1
2 2 -1       1 -2
3 0          2 -3
4 0          3
C Cell Cards end then blank line

C Surface Cards begin
1 rcc    0 0 0   0 0 10   10
2 rpp    -20  20    -20 20    0 20
3 sph   0 0 0  40
C Surface Cards end then blank line

C Data Cards begin
C need to define cell volumes because MCNP cannot
vol 3141.59  28858.41 2J
IMP:n 1 1 1 0
C both a neutron and photon problem
mode n p
C What is this source doing?
C monodirectional circular surface source at the base of the cylinder
sdef axs 0 0 1 rad d1 vec 0 0 1 dir 1 sur 1.3
si1  15
C Material 1 is U-238
m1  92238  1
C Material 2 is water
m2  1001   2  8016  1
C include delayed neutrons
totnu
print 110 170
nps 10000
C tally data cards
C F1:n 1.2  2.5 (2.1 2.2 2.3 2.4 2.5 1.3)
C F4:p 1 2 T
C F12:p 2.5
C SD12 1600
C F5:p 0 0 30 0.5
C ---- Ex15 part 1----
C tally multipliers
C pair production cross section rate units: 
C F4*sigma*N = (p/cm2*Nsrc)(b*rxn/p*at)(at/b*cm) = rxn/cm3*Nsrc
C --> multiplicative constant = -1 takes density of cell 2 in units at/b*cm
F204:p 2
C FM204 (-1 2 (-4))  (-1 2 (-1:-2)) $ --> same as below
FM204 (-1 2 (-4) (-1:-2))
C Keff units:
C F4*sigma_fission*nu*N*volume = n(fission) / n(source)
C F304:n 1
C FM304 (-1 1 (-6 -7))
C SD304 1
C --Ex15 part 2--
C energy spectrum
F11:n 2.5
C Data Cards end then recommended blank line
C Eveything after this point is ignored by MCNP
