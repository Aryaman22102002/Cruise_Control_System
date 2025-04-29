% Dynamic Model for Toyta Camry XLE: mx_double_dot = F - Fd - Fr - mgsin(theta)
% Flat Road (theta = 0), Fd is aerodynamic drag, Fr is rolling resistance

c_d = 0.29; %(Drag Co-eff of a sedan)
rho = 1.2; %(Air Density in Kg/m^3)
H = 1.455; % (Frontal Height in m)
W = 1.839; % (Frontal Width in m)
Shape_Factor = 0.85; % (Std shape factor for a sedan)
A = H*W*Shape_Factor; % (Frontal Area in m^2)
v_vehicle_ref = 27.78; %(Vehicle desired cruising speed in m/s)
v_wind = -4.0; %(Wind speed opposing direction of vehicle in m/s)
v = v_vehicle_ref + v_wind;

% The Aerodynamic Drag Force
F_d = (c_d*rho*A*v^2)/2;


c_r = 0.0125; %(Rolling Co-eff)
m = 1655; %(Mass of the vehicle in Kg)
g = 9.81; %(Acceleration due to gravity in m/s^2)


% The Rolling Resistance Force
F_r = c_r*m*g;

% The Total Resistive Force
F_total = F_d + F_r;

% Damping Co-eff
b = F_total/v_vehicle_ref;

disp("The Aerodynamic Drag Force is: ");
disp(F_d);
disp("The Rolling Resistance Force is: ");
disp(F_r);
disp("The Total Resistive Force is: ");
disp(F_total);
disp("The Required Damping Coefficient is: ");
disp(b);


