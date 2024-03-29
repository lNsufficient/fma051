function [ X ] = starting_point_generator(N, M, IMAX, sigma)
%UNTITLED2 Summary of this function goes here
%   N = number of points, M is number of coordinates
if nargin < 3
    IMAX = 20;
    sigma = 50;
end

if nargin < 4
    sigma = 50;
end

mu = -IMAX/2 + randi(IMAX, N, M);

X = mvnrnd(mu, sigma*ones(1, M));
ind = X(abs(X) < 0.00001);
X(ind) = 0.01*sign(X(ind))

if M == 2
    X(:,2) = -log(X(:,2));
end
if M == 4
    X(:,2) = -log(abs(X(:,2)));
    X(:,4) = -log(abs(X(:,4)));
end
end

