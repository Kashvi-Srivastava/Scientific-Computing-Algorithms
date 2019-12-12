%Newton divided difference
function [z] = NewtonDividedDiff(X,Y,B,n)
syms x;
%P gives the difference table
P = zeros(n);
for i = 1:n
    P(i,1) = Y(i,1);
end
for i = 2:n
    for j = 1:n-i+1
        h = X(i+j-1) - X(j);
        P(j,i) = (P(j+1,i-1)-P(j,i-1))/h;
    end
end
f = P(1,1);
t = 1;
for i = 1:n-1
    t = t*(x-X(i));
    f = f + (t*P(1,i+1));
end
simplify(f)
z=double(subs(f,B));