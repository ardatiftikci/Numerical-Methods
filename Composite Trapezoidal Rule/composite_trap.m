function [I,m] = compositetrap(fname,a,b,tol,ubound)

% First determine the number of subintervals needed to ensure
% that the error <= tol
% Note that this uses the bound   (***) Error <= M2 (b-a)^3 / (12*m^2)
m = ceil(sqrt((ubound/12)*((b-a)^3)/tol));
h = (b-a)/(m);

% left, right endpoints of the subintervals
tj = a:h:b+h;
% midpoints of the subintervals
% evaluate the function at the endpoints of the subintervals

fj = feval(fname,tj);

% Apply the composite Trapezoidal Rule
I = h/2*( fj(1) + fj(m+1) + 2*fj(2:m)*ones(m-1,1));

fprintf("%.10f",I);
return;