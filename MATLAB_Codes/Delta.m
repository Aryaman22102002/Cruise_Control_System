% Parameters
c_d = 0.29;   % Drag coefficient
rho = 1.2;    % Air density (kg/m^3)
A = 2.2744;   % Frontal area (m^2)
b = 15.3611;  % Linear damping coefficient (N⋅s/m)

% Define a small range around cruise speed (say, 27.78 m/s ± 7 m/s)
v_vals = linspace(20, 35, 200);  % velocity range (m/s)

% Calculate forces
Fd_nonlinear = 0.5 * c_d * rho * A * (v_vals.^2);
Fd_linear = b * v_vals;

% Pick cruise velocity
v_cruise = 27.78;

% Calculate drag change ΔFd after small overshoot (+3 m/s)
v_overshoot = v_cruise + 3;  % 30.78 m/s

Fd_nl_cruise = 0.5 * c_d * rho * A * (v_cruise^2);
Fd_nl_overshoot = 0.5 * c_d * rho * A * (v_overshoot^2);

Fd_l_cruise = b * v_cruise;
Fd_l_overshoot = b * v_overshoot;

delta_Fd_nonlinear = Fd_nl_overshoot - Fd_nl_cruise;
delta_Fd_linear = Fd_l_overshoot - Fd_l_cruise;

% Plot
figure;
plot(v_vals, Fd_nonlinear, 'r-', 'LineWidth', 1.5);
hold on;
plot(v_vals, Fd_linear, 'b--', 'LineWidth', 1.5);
xline(v_cruise, 'g:', ['Cruise = ' num2str(v_cruise, '%.2f') ' m/s'], 'LabelVerticalAlignment', 'bottom');

xlabel('Velocity (m/s)');
ylabel('Drag Force (N)');
title('Linear vs Nonlinear Drag Force around Cruise Velocity');
legend('Nonlinear Drag (∝ v²)', 'Linear Drag (∝ v)', 'Location', 'northwest');
grid on;

% Annotate delta Fd
text(v_overshoot-8, Fd_nl_overshoot+100, ['\Delta F_d nonlinear ≈ ' num2str(delta_Fd_nonlinear, '%.2f') ' N'], 'Color', 'red');
text(v_overshoot-8, Fd_l_overshoot-150, ['\Delta F_d linear ≈ ' num2str(delta_Fd_linear, '%.2f') ' N'], 'Color', 'blue');

plot(v_overshoot, Fd_nl_overshoot, 'ro', 'MarkerFaceColor', 'r');
plot(v_overshoot, Fd_l_overshoot, 'bo', 'MarkerFaceColor', 'b');

hold off;
