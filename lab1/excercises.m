%% 2.1a

f = @(x) 1-x*exp(-x);
[interval, fmin] = goldenSection(0,2,f,4)

%% 2.3 a)
f = @(x) x^2 + exp(-x);
[interval_goldensection, fmin] = goldenSection(-1,1,f,5)
[interval_dichotomus] = dichotomus(-1,1,f,5, 0.01)
%% 2.4ac
F = @(x_hat,d,lambda) ((x_hat(1) + lambda*d(1))^3 + x_hat(2) + lambda*d(2))^2 + ... 
    2*(x_hat(2) - x_hat(1) + 4)^4;
f = @(x) F([4;5], [1;-2], x);
[interval_goldensection, fmin] = goldenSection(-2,2,f,5)

%% 2.6
f_prim = @(x) 2*x - exp(-x)
f_bis = @(x) 2 + exp(-x)
interval = bisection(-1,1,f_prim,5)
x_newton = newton(1,[],f_prim, f_bis, 5)