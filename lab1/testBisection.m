f = @(x) x^2+x;
f_prim = @(x) 2*x+1;
a = -1; b = 1; N = 8;
bisection(a, b, f_prim ,N, f,1e-8)