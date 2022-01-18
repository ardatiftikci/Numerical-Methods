function [L,U] = tridiagonalLU(A)
[~,n] = size(A);
L = eye(n);
for i = 1:n-1
    L(i+1,i) = A(i+1,i)/A(i,i);
    A(i+1,i:i+1) = A(i+1,i:i+1) - L(i+1,i)*A(i,i:i+1);
    A(i+1,i) = 0;
end
U = A;
end