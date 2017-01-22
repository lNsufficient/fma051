clear;
[t, y] = data1;

d11 = [1, 1]';

p11 = polyfit(t, log(y), 1);
x1 = exp(p11(end));
x2 = -p11(1);
d11 = [x1, x2]';

[d21, f11] = gaussnewton(@phi1,t,y,d11, 0.01,0,1,1); 
pause;
[d21, f21] = gaussnewton(@phi2,t,y,[d21; 0; 0], 0.01,0,1,1); 
pause;


[t, y] = data2;

d12 = [1, 1]';

p12 = polyfit(t, log(y), 1);
x1 = exp(p12(end));
x2 = -p12(1);
d12 = [x1, x2]';

[d22, f12] = gaussnewton(@phi1,t,y,d12, 0.01,0,1,1); 
pause;
[d22, f22] = gaussnewton(@phi2,t,y,[d22; 0; 0], 0.01,0,1,1); 

