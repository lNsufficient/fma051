function [interval, fmin] = goldenSection(a, b, f, N)
%GOLDENSECTION 
alpha = (sqrt(5)-1)/2;

lambda_f = @(a,b) a + (1-alpha)*(b-a);
mu_f = @(a,b) a + alpha*(b-a);

lambda = zeros(2,1);
mu = lambda;
lambda(1) = lambda_f(a,b);
mu(1) = mu_f(a,b);

lambda(2) = f(lambda(1));
mu(2) = f(mu(1));

for i = 1:N
    if lambda(2) > mu(2)
        a = lambda(1);
        lambda = mu;
        mu(1) = mu_f(a, b);
        mu(2) = f(mu(1));
    else
        b = mu(1);
        mu = lambda;
        lambda(1) = lambda_f(a,b);
        lambda(2) = f(lambda(1));
    end
end
fmin = min([lambda(2),mu(2), f(a), f(b)]);
interval = [a;b];

