function lambda = newton(lambda,f,f_prim,f_bis,h, tol)
%NEWTON 
    if nargin < 5
        h = 1e-8;
    end
    if nargin < 6
        tol = 1e-6;
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

    delta = tol+1;
    
    while abs(delta) > tol
        delta = f_prim(lambda)/f_bis(lambda);
        lambda = lambda-delta;
    end
end

