clear;
[t, y] = data1;

gaussnewton(@phi2,t,y,[2.7811; 1.3834; 3.2169; 3.0136], 0.1,1,1,1); 
%gaussnewton(@phi2,t,y,[2.7811; 3.2169; 1.3834; 3.0136], 0.1,1,1,1); 
%gaussnewton(@phi2,t,y,[1; 2; 0.1; 100], 0.1,1,1,1);  
%gaussnewton(@phi1,t,y,[1;2], 0.1,1,1,1);