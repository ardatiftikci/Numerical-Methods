function [a0,a1] = best_polynomial(a,b)
%p1(x)=a0+a1x
[func_b,~]=func(b);
[func_a,~]=func(a);
a1=(func_b-func_a)/(b-a);

%bisection method to calculate c
biseca=a;
bisecb=b;
c=biseca;
[func_c,df_c] = func(c);
while(abs(df_c-a1)>10^-6)
    if(df_c>a1)
       bisecb=c; 
    else
        biseca=c;
    end
    c=(biseca+bisecb)/2;
    [func_c,df_c] = func(c);
end

%%bisection method is finished
a0=((func_c+func_a)-a1*(a+c))/2;

fprintf("p1(x)= %fx+%f",a1,a0);