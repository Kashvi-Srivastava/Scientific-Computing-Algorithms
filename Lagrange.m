%Lagrange method
function [z] = Lagrange(X,Y,B,n)
syms x;
f = 0;
for i = 1:n
    num = 1;
    den = 1;
    for j = 1:n
        if j~=i
            num = num*(x-X(j));
            den = den*(X(i)-X(j));
        end
    end
    coeff = num/den;
    f = f + (coeff*Y(i));
end
simplify(f)
z = double(subs(f,B));