function [lambd, No_of_iterations, fmin] = goldenSection(a, b, f, TOL)
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
No_of_iterations = 0;
while (b-a) > TOL
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
    No_of_iterations =  No_of_iterations + 1;
end
temp = [lambda,mu, [a; f(a)], [b; f(b)]];
[fmin, i] = min(temp(2,:));
lambd = temp(1,i);
interval = [a;b];

