function [lambda, No_of_iterations]= linesearch(func, x, d)
%LINESEARCH Summary of this function goes here
%   Detailed explanation goes here

tol = 1e-6;

f = @(lambda) func(x+lambda*d);
h = 1e-6;
lambda_start = 0;
lambda = newton(lambda_start,f,[],[],h, tol);


if isnan(func(x+lambda*d)) || func(x+lambda*d)>func(x)
    error('Bad job of the line search!')
end
end

