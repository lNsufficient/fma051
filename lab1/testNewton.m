f = @(x) x*x+exp(-x);
lambda = 0.87;
newton(lambda, f, [], [], 3)
f_prim  =@(x) 2*x - exp(-x);
f_bis = @(x)2 + exp(-x);
newton(lambda, [], f_prim, f_bis, 3)
