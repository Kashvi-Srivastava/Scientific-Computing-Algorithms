%Jacobi Iteration Method
function [X] = Jacobi(A,B,X,n)
P = zeros(n);
U = zeros(n);
for i = 1:n
    P(i,i) = A(i,i);
end
H = -(inv(P))*(A-P);
C = (inv(P))*B;
p = max(abs(eig(H)))
count = 0;
tol = 0.00005;
flag = 0;
while flag~=1
    flag = 1;
    Xp = X;
    X = (H*X) + C;
    count = count + 1;
    D = X - Xp;
    for i = 1:n
        if D(i) > tol 
            flag = 0;
            break;
        end
    end
end
count