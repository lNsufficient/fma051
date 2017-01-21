clear;
[t, y] = data2;

testpoints = [0 0 0 0; eye(4); 1,1,0,0; 1,0,1,0; 1 0 0 1; 0 1 1 0; 0 1 0 1; 0 0 1 1];
testpoints = [testpoints; 1 1 1 0; 1 1 0 1; 1 0 1 1; 0 1 1 1; 1 1 1 1];
testpoints = testpoints';
testpoints = testpoints;

%testpoints = testpoints(1:2,:);

for i = 1:length(testpoints) %Dessa är de enda som funkar
    [f, x] = gaussnewton(@phi2,t,y,testpoints(:,i), 1e-6,1,1,1); 
    pause;
end
