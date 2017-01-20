function [f_prim, f_vals, h_min, no_min]= f_der(f, h)
%Calculates the derivative. 
%f_prim derivative function handle
h_min = nan;
f_min = inf;

no_min = [0;0];
f_vals = [nan; nan];
h_start = h;
too_slow_growth_flag = 0;

f_start = f(0);
if f_start == -inf
    f_vals(1) = -inf;
    no_min = [1;0];
    f_prim = inf;
    return 
end

f_vals(1) = f_start;
f_end = f(h);
if (f(h) < f_min)
    h_min = h;
    f_min = f(h);
end
    
while (isinf(f_end)||isnan(f_start)||(f_end>=f_start))
    if (f(h) < f_min)
        h_min = h;
        f_min = f(h);
    end
    
    if f_end == -inf
        no_min = [1; h];
        f_prim = -inf;
        f_vals(2) = -inf;
        return;
    end
    h_old = h;
    h = h/2;
    if h_old == h || h == 0
        f_end = f(0); %For all small values h we get that f(h) is too large or undefined
        h = h_start;
        disp('Could not take derivative, h cannot get smaller')
        too_slow_growth_flag = 1;
        break;
    else
        f_end = f(h);
    end
end

if too_slow_growth_flag == 1
    %Good approximation of derivative lead to either not being able to find
    %defined function values or that the function had differences smaller
    %than machine epsillon for all h. Now we move h in the opposite
    %direction, the approximation is worse but atleast armijo will yield
    %something useful
    h = h_start;
    while (isinf(f_end)||isnan(f_start)||(f_end>=f_start))
        if (f(h) < f_min)
            h_min = h;
            f_min = f(h);
        end
        if f_end == -inf
            no_min = [1; h];
            f_prim = -inf;
            f_vals(2) = -inf;
            return;
        end
        h_old = h;
        h = 2*h;
        if  isinf(h)
            f_end = f(0); %No differences on the entire interval
            h = h_start;
            disp('Could not find any suitible LARGE h either')
            break;
        else
            f_end = f(h);
            if (f(h) < f_min)
                h_min = h;
                f_min = f(h);
            end
        end
    end
end

f_vals(2) = f_end;
f_prim = (f_end - f_start)/h;

    
    

end