%% Problem 2: Plot Response

clc, clear, close all

alpha_array = [-1,1,5,50,500];

f = figure;

lable_str = {};

for alpha = alpha_array

    num = [100,200+100*alpha,200*alpha];
    
    den = [1,100,199+100*alpha,200*alpha];
    
    sys = tf(num,den);

    hold on

    step(sys,30)

    lable_str = [lable_str,...
        {['\alpha = ' num2str(alpha)]}];
   
end

legend(lable_str)