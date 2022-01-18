A=zeros(5,3);
for i=1:5
    A(i,1)=1;
    A(i,2)=i*0.2;
    A(i,3)=i^2 * 0.04;
end

b = zeros(5,1);
b(1)=48.1;
b(2)=54.9;
b(3)=60.2;
b(4)=64.2;
b(5)=69.0;

x = least_squares_solution(A,b);
fprintf('The solution to the problem is [x_1,x_2,x_3]:\n');
disp(x);