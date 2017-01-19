function s = print_info(iter, x, ss, f, mabsr, normgrad, lsiters, lambda, gradd)
%PRINT_INFO returns string to print

i = 1;
s = sprintf('\n%3d %11.4f %12.4f %12.2g %12.4g %12.4f %12d %12.4f %12.4f', iter, x(i), ss, f, mabsr,normgrad, lsiters, lambda, gradd);
i = 2;
while i <= length(x)

    s = sprintf('%s\n    %11.4f', s, x(i));
    i = i+1;
end

