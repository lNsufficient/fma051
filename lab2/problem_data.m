function [A,b,f] = problem_data
% A = [-1 -3 -2; -1 -1 -1; -3 -5 -3]';
% b = [-2 -4 -3]';
% f = @(x) dot([-30, -24, -60], x);

%above is when we have Ax < b and max(f)

%we want

A = [1 3 2; 1 1 1; 3 5 3]';
b = [2 4 3]';

%To make sure that x_k >= 0;
Aones = eye(3);
bones = zeros(3,1);
A = [A; Aones];
b = [b; bones];


f = @(x) dot([30, 24, 60], x);
