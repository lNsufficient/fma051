function [lambda, No_of_iterations]= linesearch(func, x, d,func_der)
%LINESEARCH Summary of this function goes here
%   Detailed explanation goes here
%Should we implement user supplied derivative? For the assignment that
%would be good as we have the derivative as dfunc = (-2J'*r)'*dx


tol = 1e-3;
h = tol;
lambda_start = 0;
f = @(lambda) func(x+lambda*d);

%lambda = newton(lambda_start,f,[],[],h, tol);
eps = 0.5;
alpha = 2;
if nargin < 4
    [lambda, No_of_iterations, fail] = armijo(f, eps, alpha, tol);
else    
    [lambda, No_of_iterations, fail] = armijo(f, eps, alpha, tol , func_der);
end
if fail == 1
    disp('failure, using crudest estimation')
    return
end
exact_search = 1;
if exact_search
    N = 1;
    lambdas = [0; lambda*alpha];
%     while ((lambdas(2)-lambdas(1))>tol)
%         f(lambdas(1))
%         f(lambdas(2))
%         lambdas = goldenSection(lambdas(1), lambdas(2), f, TOL);
%         No_of_iterations = No_of_iterations + N;
%     end
    [lambdas, nbr_itr] = goldenSection(lambdas(1), lambdas(2), f, tol);
    No_of_iterations = No_of_iterations + nbr_itr;
    [~, index] = min([f(lambda), f(mean(lambdas))]);
    tmp = [lambda, lambdas];
    lambda = tmp(index);
end

if isnan(func(x+lambda*d)) || func(x+lambda*d)>func(x)
    disp(fail)
    error('Bad job of the line search!')
end
end

