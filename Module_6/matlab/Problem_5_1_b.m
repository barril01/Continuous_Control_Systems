% Book problem 5-1 (b)
clc, clear, close all

zeta = 0.707;
omega_n = 2;

theta = acos(zeta); 

axs_lim = omega_n^2;

len = rssq([axs_lim,axs_lim]*4/3);

circle(0,0,omega_n);
axis equal
grid on
hold on
plot([0,-len*sin(theta)],[0, len*cos(theta)],'b')
plot([0,-len*sin(theta)],[0,-len*cos(theta)],'b')

xlim([-axs_lim axs_lim]*3/4)
ylim([-axs_lim axs_lim]*3/4)

title('$0 \le \zeta \le 0.707$, $\omega_n \le 2$','Interpreter','latex' )

function h = circle(x,y,r)
    hold on
    th = 0:pi/50:2*pi;
    xunit = r * cos(th) + x;
    yunit = r * sin(th) + y;
    h = plot(xunit, yunit,'b');
    hold off
end

