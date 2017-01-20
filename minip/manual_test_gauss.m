
testpoints = [eye(4); 1,1,0,0; 1,0,1,0; 1 0 0 1; 0 1 1 0; 0 1 0 1; 0 0 1 1];
testpoints = [testpoints; 1 1 1 0; 1 1 0 1; 1 0 1 1; 0 1 1 1; 1 1 1 1];
testpoints = testpoints';

for i = [1 11 13 14 15] %Dessa är de enda som funkar
    gaussnewton(@phi2,t,y,testpoints(:,i), 0.01,1,1,1); 
    pause;
end
