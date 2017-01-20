clear;
[t, y] = data1;

gaussnewton(@phi2,t,y,[2.7811; 1.3834; 3.2169; 3.0136], 0.1,1,1,1); 
pause;
gaussnewton(@phi2,t,y,[0.1; 5; -2; 2], 0.1,1,1,1); 
pause;
gaussnewton(@phi2,t,y,[-2; -5; -3.2169; 10], 0.1,1,1,1); 



%gaussnewton(@phi2,t,y,[2.7811; 3.2169; 1.3834; 3.0136], 0.1,1,1,1); 
%gaussnewton(@phi2,t,y,[1; 2; 0.1; 100], 0.1,1,1,1);  
%gaussnewton(@phi1,t,y,[1;2], 0.1,1,1,1);