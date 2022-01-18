function x = least_squares_solution(A,b)
[Q,R]= my_qr(A);
x = linsolve(R,transpose(Q)*b);