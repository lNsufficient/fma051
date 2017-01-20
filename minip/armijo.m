function [lambda, No_of_iterations, fail] = armijo(f, eps, alpha, tol)
%ARMIJO Summary of this function goes here
%   Detailed explanation goes here
[f_prim, f_vals, h_min, no_min]= f_der(f, tol);
if abs(f_prim) < tol*10^-8
    disp('Derivative is zero, Armijo cannot be used')
    lambda = h_min;
    No_of_iterations = 0;
    fail = 1;
    return;
end
fail = 0;
f1 = f_vals(1);
No_of_iterations = 0;
lambda = 1;
while 1
    No_of_iterations = No_of_iterations + 1;
    T1 = f1 + eps*lambda*f_prim;
    lambda_old = lambda;
    if T1 < f(lambda)
        lambda = lambda/alpha;
        continue;
    else
        T2 = T1 + (alpha - 1)*eps*lambda*f_prim;
        if T2 > f(alpha*lambda)
            lambda = lambda*alpha;
        else 
            break;
        end
    end
    if lambda_old == lambda
        lambda = nan;
        fail = 1;
        disp('lambda för litet');
    elseif isinf(lambda)
        lambda = inf;
        fail = 1;
        disp('lambda inf nåt');
    end
end

if f(lambda) > f(h_min)
    lambda = h_min; %Found smaller value during derivation
end

end

