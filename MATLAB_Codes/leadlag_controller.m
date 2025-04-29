function u = leadlag_controller(e)
% e = error = v_ref - v

% Controller parameters
K = 50;
z = 0.1;
p = 0.01;

% Define s-domain operator (Laplace transform)
s = tf('s');

% Lead-Lag Transfer Function
C = K * (s + z) / (s + p);

% Apply the controller
u = C * e;
end
