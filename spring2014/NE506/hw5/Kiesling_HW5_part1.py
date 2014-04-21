#!/usr/bin/python
import math
import numpy as np
import matplotlib.pyplot as plt 

""" NE506 - HW5 - part I
    Kalin Kiesling
"""

def main_program(filename):
    pi = math.pi
    fh = open(filename)
    # initialize sphere and it's properties
    rho_a = 0.02 # atomic density [atom/b-cm]
    rho_m = 1    # mass density [g/cm3]

    # store given data into rexpective dictionaries
    num = 0
    """pos_0 = {}
    E_0 = {}
    pos_c = {}
    E_p = {}
    pos_f = {}"""
    # initialize tally scores
    surf_cur = []
    surf_flux = []
    sph_flux = []
    sph_Edep = []
    sph_pulse = []

    for line in fh:
	num = num + 1
	data = [float(x) for x in line.split(',')]
	pos_0 = data[0:3]
	E_0 = data[3]
	pos_c = data[4:7]
	E_p = data[7]
	pos_f = data[8:]
	H_T0 = E_0**2
	H_Tf = E_p**2

	# find trajectory to collision and trajectory to final position
	traj0 = calc_trajectory(pos_0,pos_c)
	trajf = calc_trajectory(pos_c,pos_f)

	# find sphere boundary crossing positions
	# assume initial and final positions are outside sphere and collision is inside sphere
	[pos_sb0, sb0] = pos_crossing(traj0, pos_0)
	[pos_sbf, sbf] = pos_crossing(trajf, pos_c)

	# find normal vector at each crossing point
	norm0 = pos_sb0/(np.dot(pos_sb0,pos_sb0))**.5
	normf = pos_sbf/(np.dot(pos_sbf,pos_sbf))**.5

	# find cos(theta) at each crossing	
	cos_theta0 = np.dot(norm0,traj0)
	cos_thetaf = np.dot(normf,trajf)

	# Estimate tallies requested:
	    # assume all weights w_ij = 1
	    # j = 1,2 (crossings)
	N = 1		# particles
	R = 10		# sphere radius
	A = 4*pi*R**2	# area
	V = 4/3*pi*R**3	# volume
	# 1) particle current on surface
	    # 1/N*sum(xi) = 1/N*sum(sum(w_ij))
	surf_cur_val = 1/N*(1+1)
	surf_cur.extend([surf_cur_val])

	# 2) particle flux on surface
	    # 1/(NA)*sum(sum(w_ij/mu_ij))
	surf_flux_val = 1/(N*A)*(1/abs(cos_theta0)+1/abs(cos_thetaf))
	surf_flux.extend([surf_flux_val])

	# 3) particle flux in sphere
	    # 1/(NV)*sum(sum(w_ij*T_ij))
		# T_ij = path length
	sph_flux_val = 1/(N*V)*(1*sb0+1*sbf)
	sph_flux.extend([sph_flux_val])

	# 4) particle energy deposition in sphere
	    # 1/(NV)*sum(sum(E_ij*w_ij*T_ij))
		# E_ij = energy of particle
	sph_Edep_val = 1/(N*V)*(1*sb0*H_T0+1*sbf*H_Tf)
	sph_Edep.extend([sph_Edep_val])

	# 5) pulse height tally in sphere
	    # 

	print num, surf_cur[num-1], surf_flux[num-1], sph_flux[num-1], sph_Edep[num-1]

    plt.hist(surf_cur,1)
    fig1 = plt.figure()

    plt.hist(surf_flux,20)
    fig2 = plt.figure()

    plt.hist(sph_flux,20)
    fig3 = plt.figure()
    plt.hist(sph_Edep,20)
#    fig4 = plt.figure()
    plt.show()

def calc_trajectory(pos0, posf): 
    x0 = pos0[0]
    y0 = pos0[1]
    z0 = pos0[2]
    xf = posf[0]
    yf = posf[1]
    zf = posf[2]
    mag = ((xf-x0)**2 + (yf-y0)**2 + (zf-z0)**2)**.5
    u = (xf-x0)/mag
    v = (yf-y0)/mag
    w = (zf-z0)/mag
    traj = [u,v,w]
    return traj



def pos_crossing(traj, pos):
    pos_s = [0, 0, 0] # centered at origin
    R = 10	 # radius [cm]

    # find distance to boundary
    A = traj[0]**2 + traj[1]**2 + traj[2]**2
    B = 2*(traj[0]*(pos[0]-pos_s[0]) + traj[1]*(pos[1]-pos_s[1]) + traj[2]*(pos[2]-pos_s[2]))
    C = (pos[0]-pos_s[0])**2 + (pos[1]-pos_s[1])**2 + (pos[2]-pos_s[2])**2 - R**2
    sb1 = (-B+(B**2-4*A*C)**(1/2))/(2*A)
    sb2 = (-B-(B**2-4*A*C)**(1/2))/(2*A)
    sb = min(sb1,sb2) # trajectory must cross sphere twice so take closest

    # calculate position of crossing
    x_cross = pos[0] + traj[0]*sb
    y_cross = pos[1] + traj[1]*sb
    z_cross = pos[2] + traj[2]*sb
    pos_cross = [x_cross, y_cross, z_cross]
    return pos_cross, sb
    


def heating_value(E):
    # calculates heating value based on particle energy E
    H_T = E**2
    return H_T




filename = "/home/kalin/Documents/spring2014/NE506/hw5/trackData.csv"
data = main_program(filename)
