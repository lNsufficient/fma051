clear;
[t, y] = data2;
X = starting_point_generator(50, 4,4,10)';

for (k = 1:50)
    
gaussnewton(@phi2,t,y,X(:,k), 0.01,1,1,1); 
pause
end
