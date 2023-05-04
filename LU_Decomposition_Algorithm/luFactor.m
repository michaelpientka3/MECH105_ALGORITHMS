function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix
format long

if nargin > 1
    error("too many input args, input just 1 arg")
end
% check if square
sizes = size(A);
if sizes(1) ~= sizes(2)
    error("A must be square matrix")
end
if all(all(A==0))
    error("matrix must have non-zero values")
end

% define P and L
P = eye(height(A));
L = P;

for i = 1:(length(A)-1)
    disp("=========")
    fprintf("i is %1d\n", i)
    for j = i:(height(A)-1)
        rowSwap = false;
        fprintf("j is %1d \n", j)
        A

        % find max in column
        disp("pivot column = ")
        disp(A(i:height(A), i))
        [maxVal, idxMax] = max(abs(A(i:height(A), i)));
        % correct for shorter column
        idxMax = idxMax + i - 1;
        fprintf("idx max is %1d \n", idxMax)

        % partial pivoting
        if idxMax ~= i
            % get top row
            topRow = A(i, :);
            pTop = P(i, :);
    
            % row swap top row w/ max for A and P
            A(i, :) = A(idxMax, :);
            P(i, :) = P(idxMax, :);
            A(idxMax, :) = topRow;
            P(idxMax, :) = pTop;
            rowSwap = true;
        end

        % Gaussian elimination
        pivotCoeff = A(j+1, i)/A(i,i);
        newRow = A(j+1, :) - pivotCoeff*A(i, :);
        A(j+1, :) = newRow;

        % update L matrix
        L(j+1, i) = pivotCoeff; L
        
        % row swap L matrix
        if i > 1 && rowSwap == true
            tempL = L(j, i-1);
            L(j, i-1) = L(idxMax, i-1);
            L(idxMax, i-1) = tempL;
        end
        
    end
end
U = A;

end