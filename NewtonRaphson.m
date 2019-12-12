%Newton Raphson Method
function [root] = NewtonRaphson(func,a)
syms x;
%root correct upto three decimal places
tol = 0.0001;
%Count gives number of iterations
count = 0;
func1 = diff(func,x);
%for the first two iterations
count = count + 2;
root = a - (subs(func,x,a)/subs(func1,x,a));
prevroot = root; 
root = prevroot - (subs(func,x,prevroot)/subs(func1,x,prevroot));
while(abs(root-prevroot)>tol)
    count = count +1;
    prevroot = root;
    root = prevroot - (subs(func,x,prevroot)/subs(func1,x,prevroot));
end
fprintf('The root is %g\n',root);
fprintf('The number of iterations are %g\n',count);
