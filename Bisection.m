%Bisection Method
function [root] = bisection(func,a,b)
syms x;
%Root upto four correct decimal places
tol = 0.00001;
%Count gives the number of iterations
count = 0;
while(abs(b-a)>tol)
    count = count +1;
    root = (a+b)/2;
    if(subs(func,x,root)*subs(func,x,b)>0)
        b = root;
    else
        if(subs(func,x,root)*subs(func,x,b)<0)
            a = root;
        else
            break;
        end
    end
end
fprintf('\n The root is %g\n',root);
fprintf('\n Number of iterations are %g\n', count);