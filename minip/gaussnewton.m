<<<<<<< HEAD
function [xn, f] = gaussnewton(phi, t, y, start, tol, use_linesearch, printout, plotout)
%GAUSSNEWTON 

r = res(phi,start,t,y);
f = sum(r.^2);
%Print initial data
if printout
    clc;
    fprintf('iter \t   x \t  step size \t    f(x)     max(abs(r))   norm(grad) \t ls iters      lambda      grad*d/norm \n');

    s = print_info(0, start, 0, f, max(abs(r)), 0, 0, 0, 0);
    disp(s)
end

if plotout
    f_plot = f;
end


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
make_posdef  = 1;
cond_eps = 1e-6;
cond_tol = 1e16;
gradd_tol = 100;
gradd = inf;
itr_max = 150;
itr = 0;
xn = start; 
x0 = inf;
func = @(x) sum(res(phi, x, t, y).^2);
while (((norm(xn-x0) >tol) && itr < itr_max) || (gradd > gradd_tol));

        
    x0 = xn;
    J = jac(x0, t);
    A = J'*J;
    Jr = (J'*r); %To be completely sure that this is the only system solved. 
    i = 0;
    if make_posdef
        %A' = A since A = J'*J;
        [R, p] = chol(A);
        while ((p > 0) || cond(A) > cond_tol)
            p_cond = [p, cond(A)];
            A = A + cond_eps *10^i* eye(size(A));
            [R, p] = chol(A);
            i = i+1;
        end
    else
        while cond(A) > cond_tol
            A_cond = cond(A)
            A = A + cond_eps *10^i* eye(size(A));
            i = i+1;
        end
    end
    if make_posdef
        dx = R\(R'\Jr);
    else
        dx = A\Jr;
    end
    gradF = 2*J'*r;
    f_der = -gradF'*dx;
    dx = dx/norm(dx);

    lambda = linesearch(func, x0,-dx);
    gradF = 2*J'*r;
    f_der = -gradF'*dx;
    gradd = f_der/norm(dx);
    
    if use_linesearch
        [lambda, ls_iters] = linesearch(func, x0,-dx,f_der);
    else
        lambda = 1;
        ls_iters = 0;
    end
    xn = x0-lambda*dx;
    
    
    %calculate stuff
    r = res(phi, xn, t, y);
    f = sum(r.^2);
    
    itr = itr + 1;
    if printout
        s = print_info(itr, xn, norm(dx), f, max(abs(r)), norm(dx), ls_iters, lambda*use_linesearch, gradd);
        disp(s);
    end
    
    if plotout
        f_plot = [f_plot, f];
    end
    
    if (abs(gradd) > gradd_tol && norm(xn-x0) <= tol)
        v = null(dx');
        v = v(:,1);
        xn = x0 + v/norm(v);
    end
end

x = xn;

if plotout
    x_plot = 1:length(f_plot);
    figure (1);
    clf;
    plot(x_plot, f_plot, '.');
    hold on;
    plot(x_plot, f_plot);
end
end

