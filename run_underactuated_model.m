clear
close all


beta = deg2rad(54.73); % skew angle
J = diag([1.675 1.750 2.700]);
h0 = 0.3;


% Orbital Parameters
alp_0 = 0.01;
eps_0 = 0.01;
kap = 5.0;
omega_bar = 0.01;
phi = 0.1;

% Control Law Parameters
k = 0.2;
mu = 1.0;
lambda = 1.0;
gamma = 4.0;
eps_s = 5.0e-5;
eps_w = 1.0e-6;

% Gimbal Rate Restriction
delta_dot_max = 1.0;

% Initial Conditions
w_0 = [0.0; 0.0]; %[0.2; -0.3];
z_0 = [0.6]%[0.5];
omega_0 = [0; 0; 0];