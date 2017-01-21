clear;
[t, y] = data2;

testpoints = [0 0 0 0; eye(4); 1,1,0,0; 1,0,1,0; 1 0 0 1; 0 1 1 0; 0 1 0 1; 0 0 1 1];
testpoints = [testpoints; 1 1 1 0; 1 1 0 1; 1 0 1 1; 0 1 1 1; 1 1 1 1];
testpoints = testpoints';

for i = 1:length(testpoints) %Dessa är de enda som funkar
    gaussnewton(@phi2,t,y,testpoints(:,i), 0.01,1,1,1); 
    pause;
end
