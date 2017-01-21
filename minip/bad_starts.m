clear;
[t, y] = data2;

a = [0.2308, -1.8374, -9.8943, -1.7306];
a = a';
gaussnewton(@phi2,t,y,a, 0.01,1,1,1); 