% Precompute once
A = -15.3611/1655;
B = 1/1655;
C = 1;
D = 0;
Q = 550;
R = 0.25;

%Q = 1100;
%R = 0.001;

K = lqr(A, B, Q, R);
sys_cl = ss(A - B*K, B, C, D);
Nbar = 1/dcgain(sys_cl);

% Display
disp(K);
disp(Nbar);
