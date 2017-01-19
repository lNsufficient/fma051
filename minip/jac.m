function j = jac(x, t, y, phi)
%JAC Summary of this function goes here
%   Detailed explanation goes here

if length(x) == 2
    dx = 2*[exp(-x(2)*t), -t*x(1).*exp(-x(2)*t)];
elseif length(x) == 4
    dx = 2*[exp(-x(2)*t), -t*x(1).*exp(-x(2)*t), exp(-x(4)*t), -t*x(3).*exp(-x(4)*t)];
end
r = res(phi, x, t,y);
j = diag(r)*dx;

end

