%% Problem 2: Roots

clc, clear, close all

alpha_array = [5,50,500];

f = figure;

col_array(1,:) = [0 0.4470 0.7410];
col_array(2,:) = [0.8500 0.3250 0.0980];
col_array(3,:) = [0.9290 0.6940 0.1250];

lable_str = [];

symb_array = {'o','x','+'};

fig_num = 0;

for alpha = alpha_array

    fig_num = fig_num + 1;

    num = [100,200+100*alpha,200*alpha];
    
    den = [1,100,199+100*alpha,200*alpha];

    plot_roots(den,col_array(fig_num,:),symb_array{fig_num})

    lable_str = [lable_str,...
        {['\alpha = ' num2str(alpha)]}];
   
end

title(['Poles: j\omega Plot'])

function plot_roots(poly,col,symb)

    poly_roots = roots(poly);
    reals = real(poly_roots);
    imags = imag(poly_roots);

    grid on
    hold on
        
    for k = 1:size(poly_roots,1)
        plot(reals(k),imags(k),...
            symb,'LineWidth',2,...
            'Color',col)
    end

    hold off

    title('Poles')

end