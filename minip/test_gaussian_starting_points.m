clear;
[t, y] = data2;
X = starting_point_generator(50, 4,4,10)';
opt = 8.9616;
sigmas = [0.1, 1,2,5,10, 20, 50, 100, 200, 500, 1000];
sigmas = linspace(0.01, 50, 20)
opt_x  = [4.1742; 0.8748; 9.7389; 2.9208];
samples = 100;
sucess = zeros(size(sigmas));
for k = 1:length(sigmas)
    sigma = sigmas(k);
    X = mvnrnd(opt_x*ones(1,samples), sigma*ones(1,samples));
    for j = 1:samples
        [x_n, f] = gaussnewton(@phi2,t,y,X(:,j), 0.01,1,0,0)
        if abs(f-opt) < 0.1
            sucess(k) = sucess(k) +1;
        end
    end
end

plot(sigmas, sucess/samples)
title('Stability of program for Gaussian starting points around minima')
xlabel('Standard deviation of parameters (x-values)')
ylabel('Percentage of samples which converged to minima')