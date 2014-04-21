c =============================================================================
c CELL CARDS                                                                 
c =============================================================================
1  2 -0.001205     -1 2 -3                                                                
2  2 -0.001205     -4 (1:-2:3)
3  0                4
c
c   blank line below

c =============================================================================
c SURFACE CARDS                                                                 
c =============================================================================                                                  
1  cx   1
2  px   100
3  px   101
c
4 so 105
c
c   blank line below

c =============================================================================
c GENERAL
c =============================================================================
c TRANSPORT PHOTONS AND ELECTRONS----------------------------------------------
MODE  p e
c                                                                               
c MATERIALS--------------------------------------------------------------------
M1    13000       -1  $ Aluminum
M2    6000 -0.000124  $ Air (density = 1.205E-3 g/cm3 - Berger)
      7000 -0.755267
      8000 -0.231781
     18000 -0.012827
c
c CELL IMPORTANCES-------------------------------------------------------------                                                
IMP:p  1 1 0
IMP:e  1 1 0 
c
c SOURCE-----------------------------------------------------------------------
SDEF POS = 0 0 0 
     ERG = D1 
     PAR = 2
     VEC = 1 0 0
     DIR = D2
c
# SI1     SP1       $ Photon energies
  0.049   0.000000
  0.051   0.000012
  0.053   0.000038
  0.055   0.000141
  0.057   0.000428
  0.059   0.004117
  0.061   0.004693
  0.063   0.001743
  0.065   0.002449
  0.067   0.006342
  0.069   0.008963
  0.071   0.005266
  0.073   0.004815
  0.075   0.005852
  0.077   0.006650
  0.079   0.007626
  0.081   0.008585
  0.083   0.009621
  0.085   0.010736
  0.087   0.011525
  0.089   0.012491
  0.091   0.013149
  0.093   0.014065
  0.095   0.014768
  0.097   0.015389
  0.099   0.016121
  0.101   0.016719
  0.103   0.017159
  0.105   0.017422
  0.107   0.017857
  0.109   0.017963
  0.111   0.018321
  0.113   0.018430
  0.115   0.018541
  0.117   0.018623
  0.119   0.018548
  0.121   0.018645
  0.123   0.018461
  0.125   0.018349
  0.127   0.018042
  0.129   0.018004
  0.131   0.017686
  0.133   0.017636
  0.135   0.017200
  0.137   0.016934
  0.139   0.016777
  0.141   0.016488
  0.143   0.016144
  0.145   0.015792
  0.147   0.015568
  0.149   0.015292
  0.151   0.014871
  0.153   0.014748
  0.155   0.014231
  0.157   0.013901
  0.159   0.013583
  0.161   0.013315
  0.163   0.012894
  0.165   0.012687
  0.167   0.012396
  0.169   0.012072
  0.171   0.011785
  0.173   0.011506
  0.175   0.011092
  0.177   0.010867
  0.179   0.010410
  0.181   0.010212
  0.183   0.009967
  0.185   0.009664
  0.187   0.009377
  0.189   0.009072
  0.191   0.008733
  0.193   0.008469
  0.195   0.008103
  0.197   0.007895
  0.199   0.007638
  0.201   0.007368
  0.203   0.007174
  0.205   0.006889
  0.207   0.006615
  0.209   0.006285
  0.211   0.005995
  0.213   0.005738
  0.215   0.005497
  0.217   0.005069
  0.219   0.004859
  0.221   0.004505
  0.223   0.004264
  0.225   0.003924
  0.227   0.003702
  0.229   0.003356
  0.231   0.003086
  0.233   0.002749
  0.235   0.002571
  0.237   0.002193
  0.239   0.001897
  0.241   0.001535
  0.243   0.001239
  0.245   0.000935
  0.247   0.000620
  0.249   0.000264
  0.251   0.0000
c
SI2    -1   0.99875   1                                                         
SP2  0    0         1
c
c TALLIES----------------------------------------------------------------------                    
c
c       
c MISCELLANEOUS----------------------------------------------------------------
NPS     1E6              
PRDMP j 1E5                      