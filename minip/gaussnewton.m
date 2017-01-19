function gaussnewton(phi, t, y, start, tol, use_linesearch, printout, plotout)
%GAUSSNEWTON 
clc;
fprintf('iter \t   x \t  step size \t    f(x)     max(abs(r))   norm(grad) \t ls iters      lambda      grad*d/norm \n');

%j = @(x) jac(x, t, y, phi);
J = jac(start, t, y, phi);

A = J'*J;
Jr = (J'*res(phi,start,t,y)); %To be completely sure that this is the only system solved. 
dx = A\Jr;
x0 = start; 
xn = x0-dx;

r = res(phi, xn, t, y);
f = sum(r.^2);
itr = 1;

s = print_info(itr, xn, norm(dx), f, max(abs(r)), norm(dx), 0, 0, 0);
disp(s)
while (norm(xn-x0) >tol);
    x0 = xn;
    J = jac(xn, t, y, phi);
    A = J'*J;
    Jr = (J'*r); %To be completely sure that this is the only system solved. 
    dx = A\Jr;
    xn = x0-dx;
    
    
    %calculate stuff
    r = res(phi, xn, t, y);
    f = sum(r.^2);
    
    itr = itr + 1;
    s = print_info(itr, xn, norm(dx), f, max(abs(r)), norm(dx), 0, 0, 0);
    disp(s);
end

end

