function interval = dichotomus(a, b, f, N, TOL)
%DICHOTOMUS 

lambda_f = @(a,b) mean([a b])-TOL;
mu_f = @(a,b) mean([a b])+TOL;

lambda = zeros(2,1);
mu = lambda;
lambda(1) = lambda_f(a,b);
mu(1) = mu_f(a,b);

lambda(2) = f(lambda(1));
mu(2) = f(mu(1));

for i = 1:N
    if lambda(2) > mu(2)
        a = lambda(1);
    else
        b = mu(1);
    end
    
    lambda(1) = lambda_f(a,b);
    mu(1) = mu_f(a,b);
    
    lambda(2) = f(lambda(1));
    mu(2) = f(mu(1));
end
interval = [a;b];
end

