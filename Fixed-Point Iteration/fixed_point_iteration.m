z= 6;
tol = 10^-8;
k = 0;
yk = 1; % initial value of y

% to find the root of f(y)=y-sqrt(z+y) for z=6
% y=g(y)=sqrt(z+y)
while abs(f(yk,z)) > tol &&  k <= 50
    fprintf('k:%d, xk:%.12f\n',k,yk);
    pause(0.3);
    yk = g(yk,z);
    k = k+1;
end

fprintf('Fixed-point iteration is ended at k=%d, root is %.12f.\n',k,yk);

function f_value = f(y,z)
f_value = y-sqrt(y+z);
end

function g_value = g(y,z)
g_value = sqrt(y+z);
end