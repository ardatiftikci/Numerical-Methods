function [f,Jf] = genEigSystem(v)
lambda = v(1);
row1 = v(2)^2 + v(3)^2 + v(4)^2 + v(5)^2 + v(6)^2 - 1;
row2 = (1-lambda)*v(2) + (2+lambda)*v(3) +(-1)*v(4);
row3 = (2+lambda)*v(2) + (1-lambda)*v(3) + (2+lambda)*v(4) +(-1)*v(5);
row4 = (-1)*v(2) + (2+lambda)*v(3) +(1-lambda)*v(4) +(2+lambda)*v(5) +(-1)*v(6);
row5 = (-1)*v(3) + (2+lambda)*v(4) +(1-lambda)*v(5) +(2+lambda)*v(6);
row6 = (-1)*v(4) + (2+lambda)*v(5) + (1-lambda)*v(6);

f = [row1;row2;row3;row4;row5;row6];
Jf = [0 2*v(2) 2*v(3) 2*v(4) 2*v(5) 2*v(6);
    (-v(2)+v(3)) (1-lambda) (2+lambda) -1 0 0;
    v(2)-v(3)+v(4) (2+lambda) (1-lambda) (2+lambda) -1 0;
    v(3)-v(4)+v(5) -1 (2+lambda) (1-lambda) (2+lambda) -1;
    v(4)-v(5)+v(6) 0 -1 (2+lambda) (1-lambda) (2+lambda);
    v(5)-v(6) 0 0 -1 (2+lambda) (1-lambda)];
    
return;


