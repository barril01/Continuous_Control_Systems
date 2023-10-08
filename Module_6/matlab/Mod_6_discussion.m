% Module 6 Discussion

clc, clear, close all

p_1  = 100;
zeta = 0.6;
omega_n = 20;

num = p_1 * omega_n^2 ;
den = conv([1, 2*zeta*omega_n, omega_n^2],[1, p_1]);

figure
col = 'b';

subplot(2,1,1)
step(tf(num,den),col)

subplot(2,1,2)
plot_roots(den,col)

p_1  = 5;

num = p_1 * omega_n^2 ;
den = conv([1, 2*zeta*omega_n, omega_n^2],[1, p_1]);

figure
col = 'r';

subplot(2,1,1)
step(tf(num,den),col)

subplot(2,1,2)
plot_roots(den,col)




function plot_roots(poly,col)

    poly_roots = roots(poly);
    reals = real(poly_roots);
    imags = imag(poly_roots);

    grid on
    hold on
        
    for k = 1:size(poly_roots,1)
        plot(reals(k),imags(k),...
            '*','LineWidth',2,...
            'Color',col)
    end

    hold off

    title('Poles')

end