clear
close all


beta = deg2rad(54.73); % skew angle
J = diag([1.675 1.750 2.700]);
h0 = 0.3;


% Control Law Parameters
alpha_0 = 0.01;
eps_0 = 0.01;
kappa = 5.0;
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
w_0 = [0.2; -0.3];
z_0 = [0.5];
omega_0 = [0; 0; 0];

tspan = 100;
% Gimbal Limits
delta_maxes = 10:50:360;

% time to 2% convergence
times = zeros(size(delta_maxes));

legstr = {};

figure(1002);
hold on;
i = 1;
for delta = delta_maxes
    delta_max = delta;
    delta_min = -delta;
    out = sim("underactuated_model.slx");

    linewidth = 1.0;

    plot(out.tout, out.z, 'Color', (delta/360) .* [0 1 0], 'LineWidth', linewidth);

    legstr = [legstr "\delta_{max} = " + delta];

    filt = out.z < .02;

    temp = out.tout(filt);
    times(i) = temp(1);

    i = i+1;
end

xlabel("Time (s)")
ylabel("Z Parameter")

legend(legstr)

figure(1003); plot(delta_maxes, times, 'LineWidth', 1.0); xlabel("Gimbal Limit (deg)"); ylabel("2% Settling Time (s)")