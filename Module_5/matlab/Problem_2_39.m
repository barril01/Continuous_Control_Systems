% Probelem 2-39

T = 0:0.01:10;

for t = 1:length(T)

    K_bound(t) = (4*T(t)+2)/(3*T(t)-1);

end

posIdx = (K_bound>0);

K_bound(~posIdx) = [];
T(~posIdx) = [];

plot(T,K_bound,'LineWidth',2)

xlim([-1,10])
ylim([-1,10])

hold on
area(T(K_bound>1),K_bound(K_bound>1),0,'EdgeColor','none','FaceColor','g')

xlim([-1,10])
ylim([-1,10])

xlabel('T')
ylabel('K')


