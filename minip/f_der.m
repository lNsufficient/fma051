function [f_prim, f_vals, no_min]= f_der(f, h)
%Calculates the derivative. 
%f_prim derivative function handle

no_min = [0;0];
f_vals = [nan; nan];
h_start = h;
%Vi valde att inte använda second order derivative, för då finns risk att
%vi tittar utanför det godkända området. 
% f_start = f(x-h/2);
% while(isinf(f_start) ||isnan(f_start))
%     if f_start == -inf
%         no_min = [1;x-h/2];
%         return 
%     end
%     h_old = h;
%     h = h/2;
%     if h_old == h
%         f_start = f(x);
%         h = h_start*2;
%         break;
%     else
%         f_start = f(x-h/2);
%     end
% end
f_start = f(0);
if f_start == -inf
    f_vals(1) = -inf;
    no_min = [1;0];
    f_prim = inf;
    return 
end

f_vals(1) = f_start;
f_end = f(h);
while (isinf(f_end)||isnan(f_start)||(f_end>f_start))
    if f_end == -inf
        no_min = [1; h];
        f_prim = -inf;
        f_vals(2) = -inf;
        return;
    end
    h_old = h;
    h = h/2;
    if h_old == h
        f_end = f(0); %For all small values h we get that f(h) is too large or undefined
        h = h_start;
        break;
    else
        f_end = f(h);
    end
end

f_vals(2) = f_end;

f_prim = (f_end - f_start)/h;

end