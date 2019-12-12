%Newton Forward Interpolation Formula
function [z] = NewtonForward(X,Y,B,n)
%P gives the difference table
P = zeros(n);
for i = 1:n
    P(i,1) = Y(i,1);
end
for i = 2:n
    for j = 1:n-i+1
        P(j,i) = P(j+1,i-1) - P(j,i-1);
    end
end
P
h = X(2) - X(1);
for i = 1:n
    if(abs(B-X(i))<h)
        p = (B-X(i))/h;
        k = i;
        break;
    end
end
z = 0;
for i = 1:n-k+1
    w = 1;
    for j = 1:i-1
        w = w*(p-j+1);
    end
    w = w/factorial(i-1);
    z = z + (w*P(k,i));
end
