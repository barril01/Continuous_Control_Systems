clc,clear 

zeta =  -log(1/100)/sqrt(pi^2 + log(1/100)^2);

num = 250; 
den = conv(conv([1 5],[1 5]),[1,0]); 

rlocus(tf(num,den)) 

bounds = 0:0.01:1; 
idx = 2; d_min = bounds; 

while abs(d_min(idx)-cosd(45))>eps 

    del = (bounds(end)-bounds(1))/100; 
    k = 0; 
    a_vals = bounds(1):del:bounds(end); 

    for a = bounds(1):del:bounds(end) 
        k = k+1; 
        [~,d] = margin(tf(num*a,den +[0 0 0 num*a])); 
        d_min(k) = abs(min(d)); 
    end 

    [~,idx] = min(abs(d_min-cosd(45))); 
    bounds = [a_vals(idx-2),a_vals(idx+2)]; 

end 

a = a_vals(idx); 
zeta = d_min(idx); 

T = 4400; 

num = (250*a)*[1 1/(a*T)]; 
den = conv(conv(conv([1 5],[1 5]),[1,0]),[1 1/T]) + [0,0,0,num]; 

stepinfo(tf(num,den)) 