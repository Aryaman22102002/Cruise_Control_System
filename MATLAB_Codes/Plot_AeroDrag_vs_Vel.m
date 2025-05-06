
Fr = c_r * m * g;  % Rolling resistance, constant

Fd_nonlinear = 0.5 * c_d * rho * A * (v_vals.^2);
F_total_nonlinear = Fd_nonlinear + Fr;

F_total_linear = b * 27.78 * ones(size(v_vals));  % already includes rolling resistance approx

% Plot
figure;
plot(v_vals, F_total_nonlinear, 'r-', 'LineWidth', 1.5); hold on;
plot(v_vals, F_total_linear, 'b--', 'LineWidth', 1.5);
xlabel('Velocity (m/s)');
ylabel('Total Resistive Force (N)');
title('Total Resistive Force: Linear vs Nonlinear');
legend('Nonlinear (Fd + Fr)', 'Linear Approx (b*v)', 'Location', 'northwest');
grid on;
