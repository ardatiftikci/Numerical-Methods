%NOTE: There are 5 generalized eigenvalues, question asks find one of them.
%Choice of initial values determines which eigenvalue will find.

%Skeleton code has written by my instructor Emre Mengi.
v=ones(6,1);
k = 0;
[f,Jf] = genEigSystem(v);
tol=10^-8;

while ((k == 0) || (norm(f) > tol)) && (k <= 100)
    
    % (1) Compute Newton direction
    p = -Jf\f;
    
    % (2) Compute step-length
    alpha = linesearch(v,p,f);
    
    % (3) Update the iterate
    v = v + alpha*p;
    
    [f,Jf] = genEigSystem(v);
    
    k = k+1;
end


if (k > 100)
    fprintf("*** Newton's method could not converge ***\n");
end

fprintf("one of the generalized eigenvalues is %f\n",v(1));
fprintf("corresponding eigevector is:\n%f\n%f\n%f\n%f\n%f\n",v(2),v(3),v(4),v(5),v(6));
