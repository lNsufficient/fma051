%% 2.1a

f = @(x) 1-x*exp(-x);
[interval, fmin] = goldenSection(0,2,f,4)

%% 2.3 a)
f = @(x) x^2 + exp(-x);
[interval_goldensection, fmin] = goldenSection(-1,1,f,5)
[interval_dichotomus] = dichotomus(-1,1,f,5, 0.01)
%% 