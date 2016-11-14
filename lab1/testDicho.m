clear;

TOL = 1e-8;

f = @(x) x*x+x;
a = -1; b = 1; N = 8;

int = dichotomus(a,b,f,N, TOL)