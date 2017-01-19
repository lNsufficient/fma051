function j = jac(x, t)
%JAC Summary of this function goes here
%   Detailed explanation goes here

if length(x) == 2
    dx = [exp(-x(2)*t), -x(1)*t.*exp(-x(2)*t)];
elseif length(x) == 4
    dx = [exp(-x(2)*t), -x(1)*t.*exp(-x(2)*t), exp(-x(4)*t), -x(3)*t.*exp(-x(4)*t)];
end
%r = res(phi, x, t,y);
j = dx;

end

