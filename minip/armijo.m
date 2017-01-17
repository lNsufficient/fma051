function [lambda, No_of_iterations, fail] = armijo(f, eps, alpha, tol)
%ARMIJO Summary of this function goes here
%   Detailed explanation goes here
[f_prim, f_vals]= f_der(f, tol);
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

end

