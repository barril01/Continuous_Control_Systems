clc,clear 

num = 200; 
den = conv(conv([1 1],[1 10]),[1,0]); 

rlocus(tf(num,den)) 

bounds = 0:0.001:0.1; 
idx = 2; d_min = bounds; 

while abs(d_min(idx)-cosd(45))>eps 

    del = (bounds(end)-bounds(1))/100; 
    k = 0; 
    a_vals = bounds(1):del:bounds(end); 

    for a = bounds(1):del:bounds(end) 
        k = k+1; 
        [~,d] = damp(tf(200*a,[1 11 10 200*a])); 
        d_min(k) = abs(min(d)); 
    end 

    [~,idx] = min(abs(d_min-cosd(45))); 
    bounds = [a_vals(idx-2),a_vals(idx+2)]; 

end 

a = a_vals(idx); 
zeta = d_min(idx); 

T = 1000; %1e5; 

num = (200*a)*[1 1/(a*T)]; 
den = conv(conv(conv([1 1],[1 10]),[1,0]),[1 1/T]) + [0,0,0,num]; 


step(tf(num,den)) 
[~,zetas] = damp(tf(num,den)); 
zeta_relative = min(zetas); 
zeta_relative_error = min(zetas)-cosd(45); 