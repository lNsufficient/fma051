clear;
[t, y] = data2;
X = starting_point_generator(50, 4,4,10)';
opt = 8.9616;
sigmas = [0.1, 1,2,5,10, 20, 50, 100, 200, 500, 1000];
sigmas = linspace(0.01, 50, 20)
opt_x  = [4.1742; 0.8748; 9.7389; 2.9208];
opt_x2 = [9.7389; 2.9208; 4.1742; 0.8748];
samples = 100;
sucess = zeros(size(sigmas));


nbr_runs = length(sigmas)*samples;
distances = ones(nbr_runs, 1)*NaN;
f_vals = distances;


for k = 1:length(sigmas)
    sigma = sigmas(k);
    X = mvnrnd(opt_x*ones(1,samples), sigma*ones(1,samples));
    for j = 1:samples
        [x_n, f] = gaussnewton(@phi2,t,y,X(:,j), 0.01,1,0,0)
        
        current_ind = (k-1)*samples + j;
        f_vals(current_ind) = abs(f-opt);
        distances(current_ind) = min(norm(X(:,j)-opt_x),norm(X(:,j)-opt_x2));
        
        if abs(f-opt) < 0.1
            sucess(k) = sucess(k) +1;
        end
    end
end

figure(1)
plot(sigmas, sucess/samples)
hold on
plot(sigmas, sucess/samples, '.')
title('Stability for Gaussian starting points around minima')
xlabel('Standard deviation of parameters (x-values)')
ylabel('Percentage that converged to minima')

figure(2)
max_y = 200;
semilogx(distances, min(max_y, f_vals), '.');
title('Plot som visar prestanda i relation till startpunkt')
xlabel('Startpunktens minsta avstånd till någon optimal punkt')
ylabel('Absolutvärde av det funna f-värdet subraherat från det optimala')

