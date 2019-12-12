%Gauss Seidel Method
function [X] = GaussSeidel(A,B,X,n)
P = zeros(n);
U = zeros(n);
for i = 1:n
    for j = 1:i
        P(i,j) = A(i,j);
    end
    for j = (i+1):n
        U(i,j) = A(i,j);
    end
end
count = 0;
H = (-inv(P))*U;
C = (inv(P))*B;
p = max(abs(eig(H)))
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
  
