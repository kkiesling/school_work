#!/usr/bin/python
import math
import numpy as np
import matplotlib.pyplot as plt 

""" NE506 - HW5 - part I
    Kalin Kiesling
"""
        
def main_program(filename):
    # This will calculate the tallies/estimators requested.
    # Returns for each: histogram, mean value, relative error
    pi = math.pi
    data = open(filename)
    # initialize sphere and it's properties
    R = float(10)		# sphere radius
    A = float(4)*pi*R**2	# area
    V = float(4)/float(3)*pi*R**3	# volume
    rho_a = 0.02        # atomic density [atom/b-cm]
    rho_m = 1           # mass density [g/cm3]
    # initialize tally scores
    num = 0
    surf_cur = []
    surf_flux = []
    sph_flux = []
    sph_Edep = []
    sph_pulse = []

    # for each set of data in the csv file, calculate the tally
    for line in data:
	num = num + 1
        # extract the pieces of data in each line
	data = [float(x) for x in line.split(',')]
	pos_0 = data[0:3]
	E_0 = data[3]
	pos_c = data[4:7]
	E_p = data[7]
	pos_f = data[8:11]
	H_T0 = E_0**2
	H_Tf = E_p**2
	# find trajectory to collision and trajectory to final position
	traj0 = calc_trajectory(pos_0,pos_c)
	trajf = calc_trajectory(pos_c,pos_f)
        # print trajf

	# find sphere boundary crossing positions
	# assume initial and final positions are outside sphere and collision is inside sphere
	[pos_sb0, sb0] = pos_crossing(traj0, pos_0)
	[pos_sbf, sbf] = pos_crossing(trajf, pos_c)

        dist_coll = ((pos_0[0]-pos_c[0])**2 + (pos_0[1]-pos_c[1])**2 + (pos_0[2]-pos_c[2])**2)**.5
        T0 = dist_coll - sb0
        Tf = sbf

	# find normal vector at each crossing point
	norm0 = pos_sb0/(np.dot(pos_sb0,pos_sb0))**.5
	normf = pos_sbf/(np.dot(pos_sbf,pos_sbf))**.5

	# find cos(theta) at each crossing	
	cos_theta0 = np.dot(norm0,traj0)
	cos_thetaf = np.dot(normf,trajf)

	# Estimate tallies requested:
	    # assume all weights w_ij = 1
	    # j = 1,2 (crossings)
	N = float(1)		# particles
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
	sph_flux_val = float(1)/(N*V)*(1*T0+1*Tf)
	sph_flux.extend([sph_flux_val])

	# 4) particle energy deposition in sphere
	    # 1/(NV)*sum(sum(E_ij*w_ij*T_ij))
		# E_ij = energy of particle
	sph_Edep_val = rho_a/(rho_m*N*V)*(1*T0*H_T0+1*Tf*H_Tf)
	sph_Edep.extend([sph_Edep_val])

	# 5) pulse height tally in sphere
	    # energy deposited in sphere
        sph_pulse_val = E_0 - E_p
        sph_pulse.extend([sph_pulse_val])

    # Plot tallies and estimators
    plt.hist(surf_cur,1)
    plt.xlabel('Surface Particle Current (particles/Nsrc)')
    plt.title('Particle Current on Surface Estimator')

    fig1 = plt.figure()
    plt.hist(surf_flux,30)
    plt.xlabel('Surface Particle Flux (particles/cm**2/Nsrc)')
    plt.title('Particle Flux on Surface Estimator')

    fig2 = plt.figure()
    plt.hist(sph_flux,30)
    plt.xlabel('Volume Particle Flux (particles/cm**3/Nsrc)')
    plt.title('Particle Flux in Sphere Estimator')

    fig3 = plt.figure()
    plt.hist(sph_Edep,30)
    plt.xlabel('Volume Energy Deposition (MeV/g/Nsrc)')
    plt.title('Particle Energy Deposition in Sphere Estimator')

    fig4 = plt.figure()
    plt.hist(sph_pulse,30)
    plt.xlabel('Pulse Height in Sphere (MeV)')
    plt.title('Pulse Height Tally')

    # find mean values and relative errors for each tally
    [surf_cur_mean, surf_cur_re] = tally_stats(surf_cur)
    [surf_flux_mean, surf_flux_re] = tally_stats(surf_flux)
    [sph_flux_mean, sph_flux_re] = tally_stats(sph_flux)
    [sph_Edep_mean, sph_Edep_re] = tally_stats(sph_Edep)
    [sph_pulse_mean, sph_pulse_re] = tally_stats(sph_pulse)

    # show results
    print "Surface Current Tally:"
    print "mean =", surf_cur_mean
    print "relative error =", surf_cur_re
    print "Surface Flux Tally:"
    print "mean =", surf_flux_mean
    print "relative error =", surf_flux_re
    print "Volume Flux Tally:"
    print "mean =", sph_flux_mean
    print "relative error =", sph_flux_re
    print "Volume Energy Deposition Tally:"
    print "mean =", sph_Edep_mean
    print "relative error =", sph_Edep_re
    print "Pulse Height Tally:"
    print "mean =", sph_pulse_mean
    print "relative error =", sph_pulse_re
    plt.show()

def tally_stats(tally_vals):
    # calculates mean value, variance, standard error, and relative error
    # for each array of tally_vals
    mean = np.mean(tally_vals)
    variance = np.mean(map(square, tally_vals)) - mean**2
    standard_error = variance/len(tally_vals)
    relative_error = standard_error**.5/mean
    return mean, relative_error 

def square(x):
    # basic math squared operator to apply to arrays
    return x**2

def calc_trajectory(pos0, posf): 
    # calculates direction [u,v,w] for particle path
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
    # calculates the point of crossing on the sphere
    pos_s = [0, 0, 0] # centered at origin
    R = float(10)	 # radius [cm]
    # find distance to boundary
    A = traj[0]**2 + traj[1]**2 + traj[2]**2
    B = float(2)*(traj[0]*(pos[0]-pos_s[0]) + traj[1]*(pos[1]-pos_s[1]) + traj[2]*(pos[2]-pos_s[2]))
    C = (pos[0]-pos_s[0])**2 + (pos[1]-pos_s[1])**2 + (pos[2]-pos_s[2])**2 - R**2
    sb1 = (-B+(B**2-4*A*C)**.5)/(2*A)
    sb2 = (-B-(B**2-4*A*C)**.5)/(2*A)
    distances = [sb1, sb2]
    # print distances
    # find minimum positve value
    sb = min(x for x in distances if x > 0) 
    # calculate position of crossing
    x_cross = pos[0] + traj[0]*sb
    y_cross = pos[1] + traj[1]*sb
    z_cross = pos[2] + traj[2]*sb
    pos_cross = [x_cross, y_cross, z_cross]
    return pos_cross, sb
    
# Execute main program
# ! change filename to be the correct path !
filename = "/home/kalin/Documents/school_work/spring2014/NE506/hw5/trackData.csv"
main_program(filename)
