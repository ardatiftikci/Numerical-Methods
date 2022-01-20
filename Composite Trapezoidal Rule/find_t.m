function t_star = find_t()
    tol=10^-8;
    %initial points of bisection method
    a=0;
    b=10;

    fprintf("Bisection Method will start with interval [%.12f,%.12f]\n",a,b);

    while((b-a)>=0.1)
        c=(a+b)/2;
        if(f(a)*f(c)<=0)
            b=c;
        else
            a=c;
        end
        fprintf('a:%.12f, b:%.12f\n',a,b);
    end

    xk = (a+b)/2; % start from midpoint of bisection
    k=0;
    fprintf("Newton's Method will start with the initial point %.12f\n",xk);
    while abs(f(xk)) > tol &&  k <= 50
        fprintf('k:%d, xk:%.12f\n',k,xk);
        pause(0.3);
        xk = g(xk);
        k = k+1;
    end

    if(abs(f(xk))<=tol)
        fprintf('The root is %.12f\n',xk);
    else

        fprintf("Newton's method has failed! Switch back to Bisection Method.\n");
        while((b-a)>=10^-4)
            c=(a+b)/2;
            if(f(a)*f(c)<=0)
                b=c;
            else
                a=c;
            end
            fprintf('a:%.12f, b:%.12f\n',a,b);%prints bisection intervals
        end

        xk = (a+b)/2; % start from midpoint of bisection
        k=0;

        fprintf("Newton's Method will start with the initial point %.12f\n",xk);

        while abs(f(xk)) > tol &&  k <= 50
            fprintf('k:%d, xk:%.12f\n',k,xk);
            pause(0.3);
            xk = g(xk);
            k = k+1;
        end

        if(abs(f(xk))<=tol)
            fprintf('The root is %.12f\n',xk);
        else
            fprintf("Newton's method has failed, again!\n");
        end
 
    end
    t_star = xk;
end
function f_value = f(x)
f_value=300-80.425*x+201.0625 * (1-exp(-0.4*x));
end

function g_value = g(x)
g_value = x - (300-80.425*x+201.0625 * (1-exp(-0.4*x)))/(-80.425+80.425*exp(-0.4*x));
end