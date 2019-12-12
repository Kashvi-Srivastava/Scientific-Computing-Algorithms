function [X] = Uppertriangular(A,B,n)
%where AX=B is the system of equations 
%C is the augmented matrix
C = [A B];
count = 0;
for k = 1:n-1
    for i  = 1+k:n
        f1 = C(i,k)/C(k,k);
        count = count + 1;
        for j = 1:n+1
            C(i,j) = C(i,j) - (f1*C(k,j));
            count = count + 2;
        end
    end
end
X(n) = C(n,n+1)/C(n,n);
count = count + 1;
for i = n-1:-1:1
    X(i) = (C(i,n+1) - sum(X(i+1:n) .* C(i,i+1:n)))/C(i,i);
    count = count + (2*(n-i) + 1);
end
count
