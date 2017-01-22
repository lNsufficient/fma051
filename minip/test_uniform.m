clear;
[t, y] = data2;

opt = 8.9616;

opt_x  = [4.1742; 0.8748; 9.7389; 2.9208];
opt_x2 = [9.7389; 2.9208; 4.1742; 0.8748];


samples = 100;

vects = rand(4, samples)-0.5;
v_norms = sqrt(sum(vects.^2));
vects = vects*diag(1./v_norms);

max_length = 40;
lengths = rand(1,samples)*max_length;

vects_d = vects*diag(lengths);

opt_X = opt_x*ones(1, samples)
X = opt_X + vects_d;

nbr_runs = samples
distances = ones(nbr_runs, 1)*NaN;
f_vals = distances;


for k = 1:nbr_runs
    k
    xk = X(:,k);
        [x_n, f] = gaussnewton(@phi2,t,y,xk, 0.01,1,0,0)
        
        current_ind = k;
        f_vals(current_ind) = abs(f-opt);
        
        distances(current_ind) = min(norm(xk-opt_x),norm(xk-opt_x2));
       
end

%%

figure(2)
max_y = 200;
plot(distances, min(max_y, f_vals), 'o');
title('Plot som visar prestanda i relation till startpunkt')
xlabel('Startpunktens minsta avstånd till någon optimal punkt')
ylabel('Absolutvärde av (f - f_{opt})')

