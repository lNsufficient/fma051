function [ out ] = barrier( x )
    problem = 1 %1,2,3,4
    if problem == 1
        x1 = x(1);
        x2 = x(2);
        %rewrite all conditions as g < 0
        g(1) = 2 - x1 - x2;
        g(2) = x1 - x2; 
        g(3) = -x1;
        g(4) = x1 + 2*x2 - 6;        
        out = -sum(1./g);
    end
    
    if problem == 2
        x1 = x(1);
        x2 = x(2);
        %rewrite all conditions as g < 0
        g = [];
        g(1) = -x1 + 3*x2 -12;
        g(2) = x1 - 3*x2 -2; 
        g(3) = 2 - x1 - 2*x2;
        g(4) = 3*x1 + 5*x2 - 34;
        g(5) = -x1;
        g(6) = -x2;

        out = -sum(1./g);
    end
    
    if problem == 3
        x1 = x(1);
        x2 = x(2);
        x3 = x(3);
        %rewrite all conditions as g < 0
        g = [];
        g(1) = x1 + 3*x2 +2*x3-30;
        g(2) = x1 + x2 +x3 -24; 
        g(3) = 3*x1 + 5*x2 + 3*x3 -60;
        g(4) = -x1;
        g(5) = -x2;
        g(6) = -x3;

        out =-sum(1./g);
    end
    
    %Dual problem, not sure if correct
    if problem == 4
        x1 = x(1);
        x2 = x(2);
        x3 = x(3);
        %rewrite all conditions as g < 0
        g = [];
        g(1) = -(x1 + 3*x2 +2*x3)+2;
        g(2) = -(x1 + x2 +x3) +4; 
        g(3) = -(3*x1 + 5*x2 + 3*x3) +3;
        g(4) = -x1;
        g(5) = -x2;
        g(6) = -x3;

        out = -sum(1./g);
    end
end

