function gaussnewton(phi, t, y, start, tol, use_linesearch, printout, plotout)
%GAUSSNEWTON 

%Print initial data
clc;
fprintf('iter \t   x \t  step size \t    f(x)     max(abs(r))   norm(grad) \t ls iters      lambda      grad*d/norm \n');
r = res(phi,start,t,y);
f = sum(r.^2);
s = print_info(0, start, 0, f, max(abs(r)), 0, 0, 0, 0);
disp(s)




%First step gauss;
%j = @(x) jac(x, t, y, phi);
% J = jac(start, t);
% 
% A = J'*J;
% Jr = (J'*r); %To be completely sure that this is the only system solved. 
% dx = A\Jr;
% x0 = start; 
% xn = x0-dx;
% 
% r = res(phi, xn, t, y);
% f = sum(r.^2);

% 
% s = print_info(itr, xn, norm(dx), f, max(abs(r)), norm(dx), 0, 0, 0);
% disp(s)

itr = 0;
xn = start; 
x0 = inf;
func = @(x) sum(res(phi, x, t, y).^2);
while (norm(xn-x0) >tol);
    x0 = xn;
    J = jac(x0, t);
    A = J'*J;
    Jr = (J'*r); %To be completely sure that this is the only system solved. 
    dx = A\Jr;
    
    if use_linesearch
        gradF = 2*J'*r;
        f_der = -gradF'*dx;
        gradd = f_der/norm(dx);
        [lambda, ls_iters] = linesearch(func, x0,-dx,f_der);
    else
        lambda = 1;
        ls_iters = 0;
        gradd = 0;
    end
    xn = x0-lambda*dx;
    
    
    %calculate stuff
    r = res(phi, xn, t, y);
    f = sum(r.^2);
    
    itr = itr + 1;
    s = print_info(itr, xn, norm(dx), f, max(abs(r)), norm(dx), ls_iters, lambda*use_linesearch, gradd);
    disp(s);
end

end

