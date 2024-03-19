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

% Gimbal Limits
delta_max = 90;
delta_min = -90;

out = sim("underactuated_model.slx");

%% Plotting
figure(1001);
tiledlayout(3, 2);
nexttile()

linewidth = 1.0;

plot(out.tout, out.z, 'Color', [0 1 0], 'LineWidth', linewidth);
hold on
plot(out.tout, out.w(1, :), 'Color', [0 0 1], 'LineWidth', linewidth);
plot(out.tout, out.w(2, :), 'Color', [1 0 0], 'LineWidth', linewidth);
xlabel("Time (s)")
ylabel("W-Z Parameters")

nexttile();
plot(out.tout, out.omega(1, :), 'Color', [0 0 1], 'LineWidth', linewidth);
hold on
plot(out.tout, out.omega(2, :), 'Color', [1 0 0], 'LineWidth', linewidth);
plot(out.tout, out.omega(3, :), 'Color', [0 1 0], 'LineWidth', linewidth);
xlabel("Time (s)")
ylabel("Angular Velocity (rad/s)")

nexttile();
plot(out.tout, out.delta_dot(1, :), 'Color', [0 0 1], 'LineWidth', linewidth);
hold on
plot(out.tout, out.delta_dot(2, :), 'Color', [1 0 0], 'LineWidth', linewidth);
xlabel("Time (s)")
ylabel("Gimbal Rate (rad/s)")

nexttile();
plot(out.tout, rad2deg(out.delta(1, :)), 'Color', [0 0 1], 'LineWidth', linewidth);
hold on
plot(out.tout, rad2deg(out.delta(2, :)), 'Color', [1 0 0], 'LineWidth', linewidth);
xlabel("Time (s)")
ylabel("Gimbal Angle (deg)")

nexttile();
plot(out.tout, -out.M_int(1, :), 'Color', [0 0 1], 'LineWidth', linewidth);
hold on
plot(out.tout, -out.M_int(2, :), 'Color', [1 0 0], 'LineWidth', linewidth);
plot(out.tout, -out.M_int(3, :), 'Color', [0 1 0], 'LineWidth', linewidth);
xlabel("Time (s)")
ylabel("Torque (N-m)")

nexttile();
plot(out.tout, out.det_D_jac, 'Color', [0 0 1], 'LineWidth', linewidth);
xlabel("Time (s)")
ylabel("|det(D)|")