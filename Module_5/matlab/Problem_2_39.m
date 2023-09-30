% Probelem 2-39

clc,clear,close all

T = 0:0.01:10;

for t = 1:length(T)

    K_bound(t) = (4*T(t)+2)/(3*T(t)-1);

end

posIdx = (K_bound>0);

K_bound(~posIdx) = [];
T(~posIdx) = [];

area(T(K_bound>1),K_bound(K_bound>1),0,'EdgeColor','none','FaceColor','g')


grid on
xlim([-1,10])
ylim([-1,10])

hold on
area([0 T(1)],[500 500],0,'EdgeColor','none','FaceColor','g')
plot(T,K_bound,'b','LineWidth',2)
plot([0,T(end)],[0,0],'b','LineWidth',2)
plot([0,0],[0,K_bound(1)],'b','LineWidth',2)

xlim([-1,10])
ylim([-1,10])

yline(1,'-','Limit')
xline(T(1),'-','Limit')

xlabel('T')
ylabel('K')


