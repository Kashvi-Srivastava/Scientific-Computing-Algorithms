%Regula Falsi Method
function [root] = RegulaFalsi(func,a,b)
syms x;
%Root upto three correct decimal places
tol = 0.0001;
%Count gives the number of iterations
count = 0;
%prevans stores the previous approximated root
prevroot = 0;
if(subs(func,x,a)*subs(func,x,b)>0)
    disp('No root in this interval');
    return;
end
%for the first iteration 
count = count + 1;
ya = subs(func,x,a);
yb = subs(func,x,b);
root = ((a*yb)-(b*ya))/(yb-ya);
if(subs(func,x,root)*subs(func,x,b)<0)
     a = root;
else
    b = root;
end
while(abs(root-prevroot)>tol)
    prevroot = root;
    count = count + 1;
    ya = subs(func,x,a);
    yb = subs(func,x,b);
    root = ((a*yb)-(b*ya))/(yb-ya);
    if(subs(func,x,root)*subs(func,x,b)<0)
        a = root;
    else
        if(subs(func,x,root)*subs(func,x,b)>0)
            b = root;
        else
            break;
        end
    end
end
fprintf('The root is %g\n',root);
fprintf('The number of iterations are %g\n',count);