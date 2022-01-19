function alpha = linesearch(v, p,f)
%Skeleton code has written by my instructor Emre Mengi.
mu = 0.73;

alpha = 1;
[fp,~] = genEigSystem(v+p);

while (1 - alpha*mu)*norm(f) < norm(fp)
    alpha = alpha/2;
    [fp,~] = genEigSystem(v+alpha*p);
end

return;

