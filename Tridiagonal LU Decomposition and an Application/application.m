A = zeros(999,999);
A(1,1)=2*10^6-(pi*pi+1);
A(1,2)=-10^6;
for i=2:998
    A(i,i-1)=-10^6;
    A(i,i)=2*10^6-(pi*pi+1);
    A(i,i+1)=-10^6;
end

A(999,998)=-10^6;
A(999,999)= 2*10^6-(pi*pi+1);
%A is initialized
b = zeros(999,1);
for i=1:999
    b(i)=-cos(pi*i/(1000));
end

%b is initialized

[L,U] = tridiagonalLU(A);
y = forward_subs(L,b);
x = back_subs(U,y);
fprintf("The numerical solution to the two-point boundary problem is:\n");
disp(x);

function y = forward_subs(L,b)
n = length(b);
y = zeros(n,1);
y(1) = b(1);

for j = 2:n
    y(j) = b(j)-L(j,j-1)*y(j-1);
end
end

function x = back_subs(U,b)
n = length(b);
x=zeros(n,1);
x(n) = b(n)/U(n,n);

for j = n-1:-1:1
    x(j) = (b(j)-U(j,j+1)*x(j+1))/(U(j,j));
end
end