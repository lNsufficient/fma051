function [lambda, No_of_iterations]= linesearch(func, x, d)
%LINESEARCH Summary of this function goes here
%   Detailed explanation goes here

tol = 1e-6;

f = @(lambda) func(x+lambda*d);
h = tol;
lambda_start = 0;
%lambda = newton(lambda_start,f,[],[],h, tol);
eps = 0.5;
alpha = 2;
[lambda, No_of_iterations, fail] = armijo(f, eps, alpha, tol);

exact_search = 1;
if exact_search
    N = 1;
    lambdas = [lambda; lambda*alpha]
%     while ((lambdas(2)-lambdas(1))>tol)
%         f(lambdas(1))
%         f(lambdas(2))
%         lambdas = goldenSection(lambdas(1), lambdas(2), f, TOL);
%         No_of_iterations = No_of_iterations + N;
%     end
    [lambdas, nbr_itr] = goldenSection(lambdas(1)*0, lambdas(2), f, tol);
    No_of_iterations = No_of_iterations + nbr_itr;
    lambda = mean(lambdas);
end

if isnan(func(x+lambda*d)) || func(x+lambda*d)>func(x)
    disp(fail)
    error('Bad job of the line search!')
end
end

