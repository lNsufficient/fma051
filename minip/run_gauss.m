clear;
[t, y] = data2;

a1 = [10.8108, 2.4786, 0, 0];

[f, x] = gaussnewton(@phi2,t,y,a1', 0.01,1,1,1); 
pause;
[f, x] = gaussnewton(@phi2,t,y,[2.7811; 1.3834; 3.2169; 3.0136], 0.01,1,1,1); 
pause;
gaussnewton(@phi2,t,y,[0.1; 5; -2; 2], 0.01,1,1,1); 
pause;
gaussnewton(@phi2,t,y,[-2; -5; -3.2169; 10], 0.01,1,1,1); 



%gaussnewton(@phi2,t,y,[2.7811; 3.2169; 1.3834; 3.0136], 0.1,1,1,1); 
%gaussnewton(@phi2,t,y,[1; 2; 0.1; 100], 0.1,1,1,1);  
%gaussnewton(@phi1,t,y,[1;2], 0.1,1,1,1);