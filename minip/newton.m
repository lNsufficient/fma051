function lambda = newton(lambda,f,f_prim,f_bis,N,h)
%NEWTON 
    if nargin < 6
        h = 1e-8;
    end

    if isempty(f_prim)
        
        f_prim = @(x) (f(x+h)-f(x-h))/(2*h);
        if isempty(f_bis)
            f_bis = @(x) (f(x+h)-2*f(x)+f(x-h))/(h^2);
        end
    end

    if isempty(f_bis)
        f_bis = @(x) (f_prim(x+h) - f_prim(x-h))/(2*h);
    end

    for i = 1:N
        lambda = lambda-f_prim(lambda)/f_bis(lambda);
    end
end

