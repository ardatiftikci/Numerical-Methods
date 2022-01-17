tol=10^-14;
xk = 0;
xk1=pi;
k = 0;

while abs(f(xk)) > tol &&  k <= 50
    fprintf('k:%d, xk:%.12f, xk1:%.12f\n',k,xk,xk1);
    pause(0.3);
    xk2 = xk1 - (f(xk1)*(xk1-xk))/(f(xk1)-f(xk));
    xk = xk1;
    xk1 = xk2;
    k = k+1;
end

fprintf('Fixed-point iteration is ended at k=%d, root is %.12f.\n',k,xk)

function f_value = f(x)
f_value = x- (sin(x)/10) -0.85;
end