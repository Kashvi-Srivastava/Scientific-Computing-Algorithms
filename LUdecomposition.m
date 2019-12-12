function [X] = LUdecomposition(A,B,n)
L = zeros(n);
U = zeros(n);
count = 0;
for i = 1:n
    L(i,i) = 1;
    count=count+1;
end
for i = 1:n
    for j = 1:n
        if i<=j
            sum = 0;
            for k = 1:i-1
                sum = sum + (L(i,k)*U(k,j));
                count=count+2;
            end
            U(i,j) = A(i,j) - sum;
            count=count+1;
        else
            sum = 0;
            for k = 1:j-1
                sum = sum + (L(i,k)*U(k,j));
                count=count+2;
            end
            L(i,j) = (A(i,j) - sum)/U(j,j);
            count=count+2;
        end
    end
end
count
Y = zeros(n);
Y(1) = B(1);
for i = 2:n
    sum = 0;
    for k = 1:i-1
        sum = sum + Y(k)*L(i,k);
        count = count + 1;
    end
    Y(i) = B(i) - sum;
    count = count + 1;
end
X(n) = Y(n)/U(n,n);
for i = n-1:-1:1
    sum = 0;
    for k = i+1:n
        sum = sum +  X(k)*U(i,k);
        count = count + 1;
    end
    X(i) = (Y(i) - sum)/U(i,i);
    count = count + 1;
end
count
