clear all; close all; clc;

%% Settings
desired_speed = 27.78; % Testing only 27.78 m/s for now
tolerance_band = 0.02; % ±2% for settling time

%% Simulate
out_linear = sim('Linear_Plant.slx');
out_nonlinear = sim('Non_Linear_plant.slx');

%% Extract
v_linear = out_linear.v_linear;
t_linear = out_linear.tout;

v_nonlinear = out_nonlinear.v_nonlinear;
t_nonlinear = out_nonlinear.tout;

sim_duration = max([t_linear(end), t_nonlinear(end)]);

%% Analyze Linear
max_v_lin = max(v_linear);
overshoot_lin = (max_v_lin - desired_speed) / desired_speed * 100;

steady_state_band_lin = [(1-tolerance_band)*desired_speed, (1+tolerance_band)*desired_speed];
inside_band_lin = (v_linear >= steady_state_band_lin(1)) & (v_linear <= steady_state_band_lin(2));

settled = false;
for i = 1:length(inside_band_lin)
    if all(inside_band_lin(i:end))
        t_settle_lin = t_linear(i);
        settled = true;
        break;
    end
end
if ~settled
    t_settle_lin = sim_duration;
end

% ---- Overshoot Correction for Linear
if overshoot_lin < 0.05
    overshoot_lin_display = 0;
else
    overshoot_lin_display = overshoot_lin;
end

%% Analyze Nonlinear
max_v_nl = max(v_nonlinear);
overshoot_nl = (max_v_nl - desired_speed) / desired_speed * 100;

steady_state_band_nl = [(1-tolerance_band)*desired_speed, (1+tolerance_band)*desired_speed];
inside_band_nl = (v_nonlinear >= steady_state_band_nl(1)) & (v_nonlinear <= steady_state_band_nl(2));

settled = false;
for i = 1:length(inside_band_nl)
    if all(inside_band_nl(i:end))
        t_settle_nl = t_nonlinear(i);
        settled = true;
        break;
    end
end
if ~settled
    t_settle_nl = sim_duration;
end

% ---- Overshoot Correction for Nonlinear
if overshoot_nl < 0.05
    overshoot_nl_display = 0;
else
    overshoot_nl_display = overshoot_nl;
end

%% Plot Linear Only
figure;
hold on;
plot(t_linear, v_linear, 'b-', 'LineWidth', 2);
yline(desired_speed, 'k-.', 'LineWidth', 1.5);

grid on;
xlabel('Time (s)', 'FontSize', 12);
ylabel('Velocity (m/s)', 'FontSize', 12);
title(sprintf('Linear Plant: v_{desired} = %.2f m/s\nOS = %.2f%%, Settling Time = %.2f s', ...
    desired_speed, overshoot_lin_display, t_settle_lin), 'FontSize', 14);
legend('Linear Velocity', 'Desired Speed', 'Location', 'best', 'FontSize', 11);

xlim([0 sim_duration]);
ylim([0 1.2 * max([max(v_linear), max(v_nonlinear)])]);

set(gca, 'FontSize', 12);
box on;
hold off;

%% Plot Nonlinear Only
figure;
hold on;
plot(t_nonlinear, v_nonlinear, 'r-', 'LineWidth', 2);
yline(desired_speed, 'k-.', 'LineWidth', 1.5);

grid on;
xlabel('Time (s)', 'FontSize', 12);
ylabel('Velocity (m/s)', 'FontSize', 12);
title(sprintf('Nonlinear Plant: v_{desired} = %.2f m/s\nOS = %.2f%%, Settling Time = %.2f s', ...
    desired_speed, overshoot_nl_display, t_settle_nl), 'FontSize', 14);
legend('Nonlinear Velocity', 'Desired Speed', 'Location', 'best', 'FontSize', 11);

xlim([0 sim_duration]);
ylim([0 1.2 * max([max(v_linear), max(v_nonlinear)])]);

set(gca, 'FontSize', 12);
box on;
hold off;
