% HW 3 (a)

clc,clear,close all

syms s K G H
 
G(s) = 1/(s+2);
H(s) = 2/(s+4);

TF = K * G /...
     (1 + G * H);

syms Q

Q(s) = solve(TF == Q/(1+Q),Q);

TF_unit = Q(s)/(1+Q(s));
