
a = 2;

func0 = @(x) (1-10^a*x)^2;
lambda_0 = linesearch(func0, 1, -1);
lambda_1=linesearch(@test_func,[0;0],[1;0]);
lambda_2=linesearch(@test_func,[0;0],[0;1]);
