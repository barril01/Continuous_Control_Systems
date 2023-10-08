%% Problem 5-18
% maximum overshoot
y_tp = 1.043;
% Overshoot
os =  y_tp - 1;
% Compute Zeta
zeta = sqrt(log(os)^2/(pi^2 + log(os)^2));
% Peak time
tr = 0.2;
% Compute omega_n
omega_n = (1 - 0.4167 *zeta + 2.917 *zeta^2)/tr;
% Solve for K
K = omega_n^2 / 25;
% Solve for K_t
K_t = (zeta * sqrt(K) - 0.5)/50;
% Create transfer function 
TF = tf(25*K,[1,(5+500*K_t),25*K]);
% Generate step response plot
[y,tOut] = step(TF);
% Get step info
step_info = stepinfo(y,tOut);

