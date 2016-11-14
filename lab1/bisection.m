function interval = bisection(a,b,f_prim,N,f,h)
%BISECTION 

if and(nargin > 4, isempty(f_prim))
    if nargin < 6
        h = 1e-8;   
    end
    f_prim = @(x) (f(x+h)-f(x-h))/(2*h);
end

for i = 1:N
    lambda = mean([a b]);
    if f_prim(lambda) > 0
        b = lambda;
    else
        a = lambda;
    end
end

interval = [a; b];
end

