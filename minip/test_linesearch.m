
a = 2;

func0 = @(x) (1-10^a*x)^2;
func0 = @(x) (1e-58*x-1)^2;
lambda_0 = linesearch(func0, 0, 1);
lambda_1=linesearch(@test_func,[0;0],[1;0]);
lambda_2=linesearch(@test_func,[0;0],[0;1]);

test_func(lambda_1*[1;0])
test_func(lambda_2*[0;1])