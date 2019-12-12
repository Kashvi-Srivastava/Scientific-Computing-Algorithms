%Gauss Elimination Method
function [X] = GaussElimination(A,B,n)
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
for k = n:-1:2
    for i = k-1:-1:1
        f2 = C(i,k)/C(k,k);
        for j = 1:n+1
            C(i,j) = C(i,j) - (f2*C(k,j));
        end
    end
end
for i = 1:n
    X(i) = C(i,n+1)/C(i,i);
end
count
X