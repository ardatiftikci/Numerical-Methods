function [Lambda,eigenvectors] = jacobi_eig(A,tol)
% Call  : [D,V] = q9(A)
% The skeleton code is written by my instructor Emre Mengi
[n,~] = size(A);
I = eye(n);
D = A(1,1)^2;
for j = 2:n
    D = D + A(j,j)^2;
end
S = norm(A,'fro')^2;
L = S - D;

iter = 0;
while L > tol
    fprintf('iter:%d, diags:%.10f, offdiags:%.10f\n',iter,D,L);
    
    % At - off-diagonal part of A
    At = A - diag(diag(A));
    
    % Find the maximal off-diagonal in |.|
    [maxcol,indp] = max(abs(At));
    [~,indq] = max(maxcol);

    pt = indp(indq);
    qt = indq;

    p = min(pt,qt);
    q = max(pt,qt);
    
    fprintf('selected off-diagonal ( %d , %d ) \n',p,q);
    pause(0.5);
    
    % Find theta
    if abs(A(p,p) - A(q,q)) > 10^-13;
        theta = (1/2)*atan(2*A(p,q)/(A(q,q) - A(p,p)));
    else
        if A(p,q) > 0
            theta = pi/4;
        else
            theta = -pi/4;
        end
    end
    
    c = cos(theta);
    s = sin(theta);
    
    
    % Right Multiply
    Apt = c*A(:,p) - s*A(:,q);
    A(:,q) = s*A(:,p) + c*A(:,q);
    A(:,p) = Apt;
    
    %Eigenvector
    Ipt = c*I(:,p) - s*I(:,q);
    I(:,q) = s*I(:,p) + c*I(:,q);
    I(:,p) = Ipt;
    
    % Left Multiply
    Apt = c*A(p,:) - s*A(q,:);
    A(q,:) = s*A(p,:) + c*A(q,:);
    A(p,:) = Apt;

    
    D = A(1,1)^2;
    for j = 2:n
        D = D + A(j,j)^2;
    end
    
    L = S - D;
    
    iter = iter+1;
end
Lambda = A;
eigenvectors = I;


return;

