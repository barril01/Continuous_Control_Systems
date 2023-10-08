%% Problem 5-18
% maximum overshoot
y_tp = 1.25;
% Overshoot
os =  y_tp - 1;
% Compute Zeta
zeta = sqrt(log(os)^2/(pi^2 + log(os)^2));
% Peak time
tp = 0.01;
% Compute omega_n
omega_n = pi/(tp * sqrt(1-zeta^2));
% Create the transfer function
TF = tf(omega_n^2,[1,2*zeta*omega_n,omega_n^2]);

