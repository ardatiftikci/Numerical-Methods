function [Q,R]= QR(A)
[m,n]=size(A);
alpha=zeros(n,1);
Q=zeros(m,n);
R=zeros(n,n);

alpha(1)=norm(A(:,1));
Q(:,1)=A(:,1)/alpha(1);
R(1,1)=alpha(1);

for i=2:n
    r=transpose(Q(:,1:i-1))*A(:,i);
    alpha(i)=norm(A(:,i) - Q(:,1:i-1)*r);
    Q(:,i)=(A(:,i)-Q(:,1:i-1)*r)/alpha(i);
    R(1:i,i:i)=vertcat(r,alpha(i));
end