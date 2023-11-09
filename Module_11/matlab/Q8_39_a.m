% 8-39 (a)
clc,clear

K = 1;

s = tf('s');

[ Gm , Pm ] = margin(K/(s*(1 + 0.1*s)*(1 + 0.5*s)));

%% Compute K for Gain Margin of 20 db

Gm_db = 20*log10(Gm);

% - Gm_db + x_db = - Gm_db_new
x_db = Gm_db - 20;

K_new = K * 10^(x_db/20);

[ Gm_new , ~ ] = margin(K_new/(s*(1 + 0.1*s)*(1 + 0.5*s)));

Gm_db_new = 20*log10(Gm_new);

%% Compute K for Phase Margin of 45 degrees
K = 1;

[G,P] = bode(K/(s*(1 + 0.1*s)*(1 + 0.5*s)));

Gm_old = interp1(squeeze(P),squeeze(G),-180+Pm);

Gm_45 = interp1(squeeze(P),squeeze(G),-180+45);


Gm_old_db = 20*log10(Gm_old);

Gm_45_db = 20*log10(Gm_45);

% - Gm_db + x_db = - Gm_db_new
x_db = Gm_old_db - Gm_45_db;

K_new = K * 10^(x_db/20);

[ ~ , Pm_new ] = margin(K_new/(s*(1 + 0.1*s)*(1 + 0.5*s)));
