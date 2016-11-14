f = @(x) x^2 + exp(-x);
a = 0; b = 1; N = 7;
interval = goldenSection(a,b,f,N);